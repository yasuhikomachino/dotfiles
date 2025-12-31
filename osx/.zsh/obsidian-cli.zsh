obs_cd() {
    local result=$(obsidian-cli print-default --path-only)
    [ -n "$result" ] && cd -- "$result"
}
