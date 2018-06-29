# -------------------------------------------------------------------
# Miscellaneous
# -------------------------------------------------------------------

# Options
setopt AUTO_CD

# SSH-Agent
is_mac && export SSH_AUTH_SOCK=~/.gnupg/S.gpg-agent.ssh

# fasd
eval "$(fasd --init auto)"

alias fuck='$(thefuck $(fc -ln -1))'

is_mac && source "`brew --prefix`/etc/grc.bashrc"
fpath=(/usr/local/share/zsh-completions $fpath)

# Direnv
eval "$(direnv hook zsh)"
