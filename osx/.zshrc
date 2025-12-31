eval "$(/opt/homebrew/bin/brew shellenv)"

# Set up completion-related paths
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# Initialize the completion system
autoload -Uz compinit && compinit

# Source plugins installed via Homebrew
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Load additional configuration files
if [ -f "$HOME/.zshrc_local" ]; then
  source "$HOME/.zshrc_local"
fi
for config_file (~/.zsh/*.zsh) source $config_file

