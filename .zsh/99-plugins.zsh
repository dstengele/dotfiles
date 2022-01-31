if [ -f /usr/share/zsh/scripts/zplug/init.zsh ]; then
    source /usr/share/zsh/scripts/zplug/init.zsh
fi

if [ -f /etc/debian_version ]; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
