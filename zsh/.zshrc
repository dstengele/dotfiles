# -------------------------------------------------------------------
# Antigen
# -------------------------------------------------------------------

source $HOME/dotfiles/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle pip
#antigen bundle command-not-found

antigen theme bureau

antigen apply

# -------------------------------------------------------------------
# Aliases
# -------------------------------------------------------------------

alias is_mac="[[ $(uname) == "Darwin" ]]"

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
alias ls='ls -Gh'
is_mac && alias cbrew='brew cask'
is_mac && alias loffice='~/Applications/LibreOffice.app/Contents/MacOS/soffice --headless'
is_mac && alias inkscape="/Applications/Inkscape.app/Contents/Resources/bin/inkscape"

alias path='echo $PATH | tr ":" "\n"'

is_mac && alias vmrun='/Applications/VMware\ Fusion.app/Contents/Library/vmrun'

# -------------------------------------------------------------------
# Variables
# -------------------------------------------------------------------

is_mac && MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
is_mac && export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/opt/X11/lib/pkgconfig/
is_mac && export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/X11/lib

export GOPATH="$HOME/gocode"

# PATH
is_mac && eval "$(/usr/libexec/path_helper -s)"
is_mac && PATH="$HOME/Library/Android/sdk/platform-tools:$PATH" # Android-Tools
PATH="$GOPATH/bin:$PATH"
is_mac && PATH="$HOME/Library/Python/2.7/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# Cask Settings
is_mac && export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Disable Virtualenv Prompt expansion
export VIRTUAL_ENV_DISABLE_PROMPT=1

export WORKON_HOME=$HOME/.virtualenv
export PROJECT_HOME=$HOME/Development

export LC_COLLATE="de_DE.UTF-8"
export LC_CTYPE="de_DE.UTF-8"
export LANG="en_US.UTF-8"

is_mac && export BYOBU_PREFIX=$(brew --prefix)

# -------------------------------------------------------------------
# Shell Options
# -------------------------------------------------------------------

# -------------------------------------------------------------------
# Functions
# -------------------------------------------------------------------

function command_exists () {
  type "$1" &> /dev/null ;
}

function pgw() {
  ping $( netstat -nr |grep 'default' | grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' | head -n 1 );
}

function extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)        tar xjf $1        ;;
            *.tar.gz)         tar xzf $1        ;;
            *.bz2)            bunzip2 $1        ;;
            *.rar)            unrar x $1        ;;
            *.gz)             gunzip $1         ;;
            *.tar)            tar xf $1         ;;
            *.tbz2)           tar xjf $1        ;;
            *.tgz)            tar xzf $1        ;;
            *.zip)            unzip $1          ;;
            *.Z)              uncompress $1     ;;
            *)                echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

function gi() {
  curl https://www.gitignore.io/api/$@ ;
}

function background() {
  convert -size 1680x1050 plasma:fractal background.png
}

function pinghost() {
  IP=$( host -t a $* | grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' );
  until ping -c 1 $IP > /dev/null ;
    do sleep 1 ;
  done ;
  afplay ~/Music/iTunes/iTunes\ Media/Tones/It\ Is\ On.m4r
}

function pingip() {
  until ping -c 1 $* > /dev/null ;
    do sleep 1 ;
  done ;
  afplay ~/Music/iTunes/iTunes\ Media/Tones/It\ Is\ On.m4r
}

function macsleep() {
  osascript -e 'tell application "System Events" to sleep'
}

man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
			man "$@"
}

# -------------------------------------------------------------------
# Miscellaneous
# -------------------------------------------------------------------

# SSH-Agent
is_mac && export SSH_AUTH_SOCK=$(launchctl getenv SSH_AUTH_SOCK)

# fasd
eval "$(fasd --init auto)"

alias fuck='$(thefuck $(fc -ln -1))'

is_mac && source "`brew --prefix`/etc/grc.bashrc"
fpath=(/usr/local/share/zsh-completions $fpath)

autoload bashcompinit
bashcompinit
source /etc/bash_completion.d/*

# -------------------------------------------------------------------
# Keybindings
# -------------------------------------------------------------------

bindkey -M vicmd '?' history-incremental-search-backward
