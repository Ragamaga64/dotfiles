# Prompt semplice per TTY
if [[ -z "$DISPLAY" ]]; then
    autoload -U colors
    colors
    export PS1="%F{green}%n@%m%f %F{blue}%1~%f %# "
fi

eval "$(starship init zsh)"

alias pushdotutils="cd ~/dotfiles && git status -s && git add . && git commit -m "Aggiornamento $(date "+%Y-%m-%d %H:%M:%S") 2>/dev/null && git push
