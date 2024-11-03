#!/usr/bin/env zsh

DOTFILES_DIR="${HOME}/dotfiles/osx"
BACKUP_DIR="${HOME}/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

# Define file paths and symbolic link mappings
typeset -A dotfiles
dotfiles=(
    "${DOTFILES_DIR}/git-cz/changelog.config.js" "${HOME}/changelog.config.js"
    "${DOTFILES_DIR}/git/.gitconfig" "${HOME}/.gitconfig"
    "${DOTFILES_DIR}/tmux/.tmux.conf" "${HOME}/.tmux.conf"
    "${DOTFILES_DIR}/zsh/.zshrc" "${HOME}/.zshrc"
    "${DOTFILES_DIR}/zsh/.zsh/aliases.zsh" "${HOME}/.zsh/aliases.zsh"
    "${DOTFILES_DIR}/zsh/.zsh/asdf.zsh" "${HOME}/.zsh/asdf.zsh"
    "${DOTFILES_DIR}/zsh/.zsh/fzf.zsh" "${HOME}/.zsh/fzf.zsh"
    "${DOTFILES_DIR}/zsh/.zsh/ghq.zsh" "${HOME}/.zsh/ghq.zsh"
    "${DOTFILES_DIR}/zsh/.zsh/go.zsh" "${HOME}/.zsh/go.zsh"
    "${DOTFILES_DIR}/zsh/.zsh/tmux.zsh" "${HOME}/.zsh/tmux.zsh"
    "${DOTFILES_DIR}/zsh/.zsh/starship.zsh" "${HOME}/.zsh/starship.zsh"
    "${DOTFILES_DIR}/nvim" "${HOME}/.config/nvim"
    "${DOTFILES_DIR}/starship/starship.toml" "${HOME}/.config/starship.toml"
    "${DOTFILES_DIR}/yabai/yabairc" "${HOME}/.config/yabai/yabairc"
    "${DOTFILES_DIR}/skhd/skhdrc" "${HOME}/.config/skhd/skhdrc"
    "${DOTFILES_DIR}/homebrew/.Brewfile" "${HOME}/.Brewfile"
)

create_symlink() {
    local source=$1
    local target=$2

    if [[ ! -e ${source} ]]; then
        echo "Warning: ${source} not found. Skipping."
        return
    fi

    if [[ -e ${target} || -d ${target} ]]; then
        if [[ ! -L ${target} ]]; then
            mkdir -p ${BACKUP_DIR}
            mv ${target} ${BACKUP_DIR}/
            echo "Backed up: ${target} -> ${BACKUP_DIR}/$(basename ${target})"
        else
            unlink ${target}
            echo "Removed existing symbolic link: ${target}"
        fi
    fi

    mkdir -p $(dirname ${target})
    ln -fs ${source} ${target}
    echo "Created symbolic link: ${target} -> ${source}"
}

remove_symlink() {
    local target=$1

    if [[ -L ${target} ]]; then
        unlink ${target}
        echo "Removed symbolic link: ${target}"
    elif [[ -e ${target} ]]; then
        echo "Warning: ${target} is not a symbolic link. Skipping removal."
    else
        echo "Info: ${target} not found."
    fi
}

setup() {
    echo "Starting setup..."
    
    mkdir "${HOME}/.config" 
    for source target in ${(kv)dotfiles}; do
        create_symlink ${source} ${target}
    done

    sh ${DOTFILES_DIR}/git/install.sh
    sh ${DOTFILES_DIR}/homebrew/install.sh
    sh ${DOTFILES_DIR}/asdf/install.sh

    echo "Setup completed. Start a new shell or run 'source ~/.zshrc' to apply changes."
}

cleanup() {
    echo "Starting symbolic link removal..."
    for target in ${dotfiles}; do
        remove_symlink ${target}
    done

    echo "Cleanup completed."
}

case $1 in
    setup)
        setup
        ;;
    clean)
        cleanup
        ;;
    *)
        echo "Usage: $0 [setup|clean]"
        echo "  setup: Install packages and create symbolic links for dotfiles"
        echo "  clean: Remove created symbolic links"
        exit 1
        ;;
esac
