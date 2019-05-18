# -------------------------------------------------------------------
# Miscellaneous
# -------------------------------------------------------------------

# Options
setopt AUTO_CD

# fasd
eval "$(fasd --init auto)"

alias fuck='$(thefuck $(fc -ln -1))'

# Direnv
eval "$(direnv hook zsh)"
