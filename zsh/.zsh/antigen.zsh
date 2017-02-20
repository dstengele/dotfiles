# -------------------------------------------------------------------
# Antigen
# -------------------------------------------------------------------

source $HOME/dotfiles/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle pip
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme bureau

antigen apply

