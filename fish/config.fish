# ---
# alias
# ---
alias ll='ls -la'
alias vim='nvim'
alias gj='ghq_fzf_repo'

# ---
# path
# ---
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin

# ---
# theme: bobthefish
# ---
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts no
set -g theme_newline_cursor yes
set -g theme_newline_prompt '$ '
set -g theme_display_date no
set -g theme_display_cmd_duration no

# ---
# asdf
# ---
source /opt/homebrew/opt/asdf/libexec/asdf.fish

# ---
# ghq + fzf
# ---
function ghq_fzf_repo -d 'Repository search'
  cd (ghq list --full-path | fzf)
end
