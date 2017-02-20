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

function man() {
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
