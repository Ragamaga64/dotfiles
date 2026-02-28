#!/bin/bash
# ============================
# Script per aggiornare dotfiles
# ============================

REPO="$HOME/dotfiles"

echo "Aggiornamento dotfiles in $REPO..."

# Crea cartelle se non esistono
mkdir -p "$REPO/hypr" "$REPO/waybar" "$REPO/wofi" "$REPO/kitty"

# Copia config
cp -r ~/.config/hypr/* "$REPO/hypr/" 2>/dev/null
cp -r ~/.config/waybar/* "$REPO/waybar/" 2>/dev/null
cp -r ~/.config/wofi/* "$REPO/wofi/" 2>/dev/null
cp -r ~/.config/kitty/* "$REPO/kitty/" 2>/dev/null

# Copia shell config
cp ~/.zshrc "$REPO/" 2>/dev/null
cp ~/.bashrc "$REPO/" 2>/dev/null

# Genera elenco file aggiornato
find . -type f > filelist.txt

# Vai nella repo
cd "$REPO" || exit

# Aggiungi, commit e push via SSH
git add .
git commit -m "Aggiornamento dotfiles e lista file $(date +"%Y-%m-%d %H:%M:%S")"
git push origin main

echo "Aggiornamento completato ✅"
