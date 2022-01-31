# -------------------------------------------------------------------
# Functions
# -------------------------------------------------------------------

function disk_ids() {
    ls -la /dev/disk/by-id/ | tail -n+4 | grep -v part | rev | sort | rev | awk '{ printf "%s\t%s\t%s\n", $(NF-2), $(NF-1), $(NF) }' | column -t
}

function command_exists () {
    type "$1" &> /dev/null ;
}

function pgw() {
    ping $( netstat -nr | grep 'default' | grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' | head -n 1 );
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

function keychain_get_password () {
    security find-generic-password -w -s $1
}
function keychain_get_username () {
    security find-generic-password -s $1 | grep acct | head -n 7 | tail -n 1 | cut -d "\"" -f 4 | perl -pe 's[\\(?:([0-7]{1,3})|(.))] [defined($1) ? chr(oct($1)) : $2]eg'
}

function bwlockzone() {
    bw lock add dns -i file:/var/lib/bind/primary/$1
}

function ffind() {
    find $1 -iname \*$2\*
}

function gcal() {
    local GCAL_BIN="gcalcli"
    local OPTS=""

    if [[ $1 = "work" ]] ; then
        OPTS+="--configFolder ~/.gcalci/work --calendar Dennis"
        if [[ $2 = "team" ]] ; then
            OPTS+="--calendar Team\ Ghostbusters"
        fi
    fi
    if [[ $1 = "private" ]] ; then
        OPTS+="--configFolder ~/.gcalci/private --calendar Dennis"
    fi
    echo $GCAL_BIN $OPTS
}

function bweditnode() {
    if [ ! -z $BW_REPO_PATH ]
    then
        FILETOEDIT=$(grep -Rl $1\'] $BW_REPO_PATH/nodes)
    else
        FILETOEDIT=$(grep -Rl $1\'] $PWD)
    fi
    vim $FILETOEDIT
}

function ssh() {
    if [[ $IS_WORK == yes ]]; then
        local certfile=$(command ssh -G $@ | grep certificatefile | awk '{ print $2 }')

        if [ -n $certfile ]; then
            local valid=$(date -d $(ssh-keygen -L -f $certfile | grep Valid: | awk '{ print $5 }') +%s)
            local now=$(date +%s)

            if [ $valid -le $now ]; then
                az ssh config --ip \*.intern.dvag --file ~/.ssh/config.d/azure_cert --overwrite
            fi
        fi
    fi

    command ssh $@
}
