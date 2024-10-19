#!/usr/bin/env zsh

DOTFILES_DIR="${HOME}/dotfiles/osx"
BACKUP_DIR="${HOME}/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
GIT_CONFIG_LOCAL="${HOME}/.gitconfig.local"

# Define file paths and symbolic link mappings
typeset -A dotfiles
dotfiles=(
    "${DOTFILES_DIR}/changelog.config.js" "${HOME}/changelog.config.js"
    "${DOTFILES_DIR}/.gitconfig" "${HOME}/.gitconfig"
    "${DOTFILES_DIR}/.tmux.conf" "${HOME}/.tmux.conf"
    "${DOTFILES_DIR}/.zshrc" "${HOME}/.zshrc"
    "${DOTFILES_DIR}/.zsh/aliases.zsh" "${HOME}/.zsh/aliases.zsh"
    "${DOTFILES_DIR}/.zsh/asdf.zsh" "${HOME}/.zsh/asdf.zsh"
    "${DOTFILES_DIR}/.zsh/fzf.zsh" "${HOME}/.zsh/fzf.zsh"
    "${DOTFILES_DIR}/.zsh/ghq.zsh" "${HOME}/.zsh/ghq.zsh"
    "${DOTFILES_DIR}/.zsh/go.zsh" "${HOME}/.zsh/go.zsh"
    "${DOTFILES_DIR}/.zsh/tmux.zsh" "${HOME}/.zsh/tmux.zsh"
    "${DOTFILES_DIR}/.zsh/starship.zsh" "${HOME}/.zsh/starship.zsh"
    "${DOTFILES_DIR}/.config/nvim" "${HOME}/.config/nvim"
    "${DOTFILES_DIR}/.config/starship.toml" "${HOME}/.config/starship.toml"
    "${DOTFILES_DIR}/Brewfile" "${HOME}/Brewfile"
)

install_dependencies() {
    echo "Starting installation of dependencies..."

    if (( ! $+commands[brew] )); then
        echo "Homebrew is not installed. Please install it."
        echo "Installation instructions: https://brew.sh/"
        return 1
    fi

    # Install dependencies using Brewfile
    brew bundle --file=${HOME}/Brewfile

    # Install Node.js using asdf
    if (( $+commands[asdf] )); then
        echo "Installing Node.js..."
        asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
        asdf install nodejs latest
        asdf global nodejs latest
        echo "Node.js installation completed."
    else
        echo "asdf is not installed. Skipping Node.js installation."
    fi

    echo "Dependency installation completed."
}

create_gitconfig_local() {
    if [[ ! -e ${GIT_CONFIG_LOCAL} ]]; then
        echo -n "git config user.email?> "
        read GIT_AUTHOR_EMAIL

        echo -n "git config user.name?> "
        read GIT_AUTHOR_NAME

        cat << EOF > ${GIT_CONFIG_LOCAL}
[user]
  name = ${GIT_AUTHOR_NAME}
  email = ${GIT_AUTHOR_EMAIL}
EOF
        echo "Created ${GIT_CONFIG_LOCAL}"
    fi
}

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
            rm ${target}
            echo "Removed existing symbolic link: ${target}"
        fi
    fi

    mkdir -p $(dirname ${target})
    ln -s ${source} ${target}
    echo "Created symbolic link: ${target} -> ${source}"
}

remove_symlink() {
    local target=$1

    if [[ -L ${target} ]]; then
        rm ${target}
        echo "Removed symbolic link: ${target}"
    elif [[ -e ${target} ]]; then
        echo "Warning: ${target} is not a symbolic link. Skipping removal."
    else
        echo "Info: ${target} not found."
    fi
}

setup() {
    echo "Starting dotfiles setup..."
    for source target in ${(kv)dotfiles}; do
        create_symlink ${source} ${target}
    done

    create_gitconfig_local
    install_dependencies

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
