#!/bin/bash

set -eu

DOTFILE_DIR=$(pwd -P)

# fish
mkdir -p ~/.config/fish
ln -sf ${DOTFILE_DIR}/fish/config.fish ~/.config/fish/config.fish
ln -sf ${DOTFILE_DIR}/fish/fish_plugins ~/.config/fish/fish_plugins

# neovim
mkdir -p ~/.config/nvim/autoload
ln -sf ${DOTFILE_DIR}/nvim/init.vim ~/.config/nvim/init.vim

# git
ln -sf ${DOTFILE_DIR}/git/.gitconfig ~/.gitconfig
