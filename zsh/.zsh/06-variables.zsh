# -------------------------------------------------------------------
# Variables
# -------------------------------------------------------------------

export GOPATH="$HOME/gocode"

# PATH
export PATH="/usr/lib/ccache/bin:$GOPATH/bin:$HOME/bin:$HOME/.mutt/bin:$HOME/.local/bin:$PATH"

# Disable Virtualenv Prompt expansion
export VIRTUAL_ENV_DISABLE_PROMPT=1

export WORKON_HOME=$HOME/.virtualenv
export PROJECT_HOME=$HOME/Development

export ZSH_DISABLE_COMPFIX=true

export COLORTERM=truecolor

export EDITOR=vim

export TAPE=/dev/st0m

export IS_WORK=$([[ $USER = "e13itjw" ]] && echo "yes" || echo "no")
