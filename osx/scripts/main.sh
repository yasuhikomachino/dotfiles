#!/usr/bin/env zsh

DOTFILES_DIR="${HOME}/dotfiles/osx"

setup() {
    echo "Starting setup..."

    sh ${DOTFILES_DIR}/scripts/git/create_gitconfig_local.sh
    sh ${DOTFILES_DIR}/scripts/homebrew/install.sh

    echo "Setup completed!"
}

case $1 in
    setup)
        setup
        ;;
    *)
        echo "Usage: $0 [setup]"
        echo "  setup: Install packages"
        exit 1
        ;;
esac
