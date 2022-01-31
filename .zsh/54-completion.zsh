autoload -Uz compinit
compinit

# Load Bash Completions
autoload -U +X bashcompinit
bashcompinit
if [ -d /etc/bash_completion.d ]; then
    for bashcompletion in /etc/bash_completion.d/*; do
        source $bashcompletion
    done
fi

zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1
setopt COMPLETE_ALIASES

# Make sshrc use ssh completion
compdef sshrc=ssh
