# -------------------------------------------------------------------
# Variables
# -------------------------------------------------------------------

is_mac && MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
is_mac && MANPATH="/opt/local/share/man:$MANPATH"
is_mac && export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/opt/X11/lib/pkgconfig/
is_mac && export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/X11/lib

export GOPATH="$HOME/gocode"

# PATH
is_mac && eval "$(/usr/libexec/path_helper -s)"
PATH="/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin:$PATH"
is_mac && PATH="$HOME/Library/Android/sdk/platform-tools:$PATH" # Android-Tools
PATH="$GOPATH/bin:$PATH"
is_mac && PATH="$HOME/Library/Python/2.7/bin:$PATH"
is_mac && PATH="/usr/local/sbin:$PATH"
is_mac && PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.mutt/bin:$PATH"
export PATH="$HOME/work/openconnect-configs:$PATH"

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

export BW_REPO_PATH=~/work/isac/bw

export ZSH_DISABLE_COMPFIX=true

export COLORTERM=truecolor

is_mac && export HOMEBREW_NO_AUTO_UPDATE=1
