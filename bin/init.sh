#!/bin/bash

set -eu

# ----
# Install xcode
# ----
if [ -z "$(command -v xcode-select)" ]; then
    echo "Install xcode-select..."
    xcode-select --install > /dev/null
fi

# ----
# Install Fisher
# ----
FISHER_PATH=~/.config/fish/functions/fisher.fish
if [ ! -f "$FISHER_PATH" ]; then
    echo "Install Fisher..."
    curl -Lo $FISHER_PATH --create-dirs https://git.io/fisher
fi

# ----
# Install Vim-Plug
# ----
VIM_PLUG_PATH=~/.config/nvim/autoload/plug.vim
if [ ! -f "$VIM_PLUG_PATH" ]; then
    echo "Install Vim-Plug..."
    curl -Lo $VIM_PLUG_PATH --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
