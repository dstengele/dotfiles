if [ -f /usr/share/zsh/scripts/zplug/init.zsh ]; then
    source /usr/share/zsh/scripts/zplug/init.zsh
fi

if [ -f /etc/debian_version ]; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [ -f /run/current-system/sw/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /run/current-system/sw/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
