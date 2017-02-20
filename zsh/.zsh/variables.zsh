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
