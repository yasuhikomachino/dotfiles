#!/usr/bin/env zsh

if ! command -v asdf >/dev/null 2>&1; then
    echo "asdf is not installed. Skipping Node.js installation."
    exit
fi

echo "Installing Node.js..."

if ! asdf plugin list | grep -q "nodejs"; then
    asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
fi

asdf install nodejs latest
asdf global nodejs latest
echo "Node.js installation completed."

