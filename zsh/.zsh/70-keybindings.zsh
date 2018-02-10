# -------------------------------------------------------------------
# Keybindings
# -------------------------------------------------------------------

bindkey -M vicmd '?' history-incremental-search-backward

# Make Del key work
bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char
