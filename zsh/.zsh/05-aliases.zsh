# -------------------------------------------------------------------
# Aliases
# -------------------------------------------------------------------

alias is_mac="[[ $(uname) == "Darwin" ]]"

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

is_mac && alias minecraft='java -Xmx4096M -Xms4096M -jar /Applications/Minecraft.app/Contents/Resources/Java/Bootstrap.jar'

alias makepdf='latexmk -pdf -pvc'


is_mac && alias notify='/Users/derintendant/Development/terminal-notifier/build/Release/terminal-notifier.app/Contents/MacOS/terminal-notifier'
alias ls='ls -Gh --color=auto'
is_mac && alias cbrew='brew cask'
is_mac && alias loffice='~/Applications/LibreOffice.app/Contents/MacOS/soffice --headless'
is_mac && alias inkscape="/Applications/Inkscape.app/Contents/Resources/bin/inkscape"

alias path='echo $PATH | tr ":" "\n"'

is_mac && alias vmrun='/Applications/VMware\ Fusion.app/Contents/Library/vmrun'

is_mac && alias make-ca-bundle="~/homebrew/opt/curl/libexec/mk-ca-bundle.pl ~/.ca-bundle"
