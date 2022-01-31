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

# Window Title
case "$TERM" in (rxvt|rxvt-*|st|st-*|*xterm*|(dt|k|E)term)
    local term_title () { print -n "\e]0;${(j: :q)@}\a" }
    precmd () {
      local DIR="$(print -P '[%c]%#')"
      term_title "$DIR" "zsh"
    }
    preexec () {
      local DIR="$(print -P '[%c]%#')"
      local CMD="${(j:\n:)${(f)1}}"
      term_title "$DIR" "$CMD"
    }
  ;;
esac
