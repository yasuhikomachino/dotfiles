#!/bin/bash

set -eu

cd "${HOME}"

# ----
# HomeBrew
# ----
if ! type /opt/homebrew/bin/brew >/dev/null 2>&1; then
    echo "Install HomeBrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# ----
# Git
# ----
if ! type git >/dev/null 2>&1; then
    echo "Install Git..."
    /opt/homebrew/bin/brew install git
fi

# ----
# Dotfiles
# ----
if [ ! -d dotfiles ]; then
    echo "Clone dotfiles..."
    git clone https://github.com/yasuhikomachino/dotfiles.git
fi

cd dotfiles

make all

/bin/bash bin/fish/init.sh
