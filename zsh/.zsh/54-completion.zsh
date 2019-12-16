if [[ $UID ]]; then
  compinit -d "${ZSH_COMPDUMP}"
else
  compinit -i -d "${ZSH_COMPDUMP}"
fi

fpath=(/usr/local/share/zsh/site-functions $fpath)


autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES

# Make sshrc use ssh completion
compdef sshrc=ssh
