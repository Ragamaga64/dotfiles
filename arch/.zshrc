# ============================
# Prompt semplice per TTY
# ============================
if [[ -z "$DISPLAY" ]]; then
    autoload -U colors
    colors
    export PS1="%F{green}%n@%m%f %F{blue}%1~%f %# "
fi

# ============================
# Starship prompt
# ============================
eval "$(starship init zsh)"

# ============================
# Alias per dotfiles
# ============================
# Aggiorna e push via script
alias updots="~/dotfiles/update-dotfiles.sh"

# Ripristina configurazioni con backup
alias redots="~/dotfiles/restore-dotfiles.sh"

# Alias opzionale per push rapido tramite git
alias pushdotutils="cd ~/dotfiles && git status -s && git add . && git commit -m 'Update $(date +'%Y-%m-%d %H:%M:%S')' && git push origin main"

# ============================
# Funzione backup-dotfiles
# ============================
backup-dotfiles() {
    REPO="$HOME/dotfiles"
    BACKUP_DIR="$HOME/dotfiles_backup_$(date +"%Y%m%d_%H%M%S")"

    echo "Backup dei vecchi dotfiles in $BACKUP_DIR"
    mkdir -p "$BACKUP_DIR"

    for config in hypr waybar wofi kitty zshrc bashrc; do
        case $config in
            hypr|waybar|wofi|kitty)
                SRC="$HOME/.config/$config"
                ;;
            zshrc)
                SRC="$HOME/.zshrc"
                ;;
            bashrc)
                SRC="$HOME/.bashrc"
                ;;
        esac

        if [[ -e $SRC ]]; then
            read "choice?Vuoi fare il backup di $config? [y/N] "
            if [[ $choice == [yY] ]]; then
                echo "Backup di $config..."
                cp -r "$SRC" "$BACKUP_DIR/" 2>/dev/null
            fi
        fi
    done

    echo "Backup completato ✅ in $BACKUP_DIR"
}
