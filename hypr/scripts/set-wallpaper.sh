#!/bin/bash
# Avvia il daemon swww se non è già in esecuzione
pgrep -x swww-daemon > /dev/null || swww-daemon &

# Attendere 0.2 secondi per sicurezza
sleep 0.2

# Imposta il wallpaper
swww img /home/ragamaga/Wallpapers/wallpaper.jpg --resize crop &
