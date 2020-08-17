# -------------------------------------------------------------------
# Aliases
# -------------------------------------------------------------------

alias is_mac="[[ $(uname) == "Darwin" ]]"
alias is_work="echo $http_proxy | grep -q proxy.id.dvag.com"

alias ll="ls -lah"
alias l="ls -lAh"

alias zshconfig="edit ~/.zshrc"

alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gco='git checkout '
alias du='du -h'

# Human-readable Output
alias duh='du -h -d'

alias tmux='tmux -u'
alias playspace='play -nq -c1 synth whitenoise band -n 100 20 band -n 50 20 gain +30 fade h 1 86400 1'
alias playnetwork='sudo tcpdump -n -w- | play --buffer 10000 -r 8000 -b 8 -c 1 -e signed-integer -t raw - band 2k vol 0.1'

alias dunnet='emacs -batch -l dunnet'


alias makepdf='latexmk -pdf -pvc'


alias ls='ls -Gh --color=auto'

alias path='echo $PATH | tr ":" "\n"'

command_exists sshrc && alias ssh="sshrc"
