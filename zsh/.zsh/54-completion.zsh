if [[ $UID ]]; then
  compinit -d "${ZSH_COMPDUMP}"
else
  compinit -i -d "${ZSH_COMPDUMP}"
fi



autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES
