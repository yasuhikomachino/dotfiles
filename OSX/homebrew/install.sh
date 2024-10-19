#!/usr/bin/env zsh

if (( ! $+commands[brew] )); then
    echo "Homebrew is not installed. Please install it."
    echo "Installation instructions: https://brew.sh/"
    return 1
fi

brew bundle --global 
