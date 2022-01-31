autoload -Uz compinit
compinit

# Load Bash Completions
autoload -U +X bashcompinit
bashcompinit
for bashcompletion in /etc/bash_completion.d/*; do
    source $bashcompletion
done

zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1
setopt COMPLETE_ALIASES

# Make sshrc use ssh completion
compdef sshrc=ssh
