# WezTerm utilities

# Set tab title
function st() {
  echo -ne "\033]1;$1\007"
}
