#!/bin/bash

set -eu

fish_path="/opt/homebrew/bin/fish"

if grep -q "fish" /etc/shells; then
    echo "Fish found in /etc/shells"
else
    echo "Add fish to /etc/shells..."
    echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
fi

current_shell=$(echo $SHELL)

if [ "$current_shell" != "$fish_path" ]; then
  echo "Changing the default shell to fish."
  chsh -s $fish_path
  echo "Default shell has been changed to fish. Please log out and log back in."
else
  echo "The current default shell is already fish."
fi

