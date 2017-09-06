# -------------------------------------------------------------------
# Miscellaneous
# -------------------------------------------------------------------

# SSH-Agent
is_mac && export SSH_AUTH_SOCK=~/.gnupg/S.gpg-agent.ssh

# fasd
eval "$(fasd --init auto)"

alias fuck='$(thefuck $(fc -ln -1))'

is_mac && source "`brew --prefix`/etc/grc.bashrc"
fpath=(/usr/local/share/zsh-completions $fpath)

#source "$GOPATH/src/github.com/sachaos/todoist/todoist_functions.sh"
source /usr/local/etc/profile.d/piknik.sh
