# -------------------------------------------------------------------
# Keybindings
# -------------------------------------------------------------------

bindkey -M vicmd '?' history-incremental-search-backward

# Make Del key work
bindkey "^[[3~"              delete-char
bindkey "^[3;5~"             delete-char
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}"  end-of-line
bindkey "^[[H"               beginning-of-line
bindkey "^[[F"               end-of-line
