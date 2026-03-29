#!/bin/bash

# Controlla se nftables è attivo
if systemctl is-active --quiet nftables; then
    # Se attivo, fermalo
    sudo systemctl stop nftables
    echo '{"text":"🔓","class":"inactive","tooltip":"Firewall inattivo"}'
else
    # Se inattivo, avvialo
    sudo systemctl start nftables
    echo '{"text":"🔒","class":"active","tooltip":"Firewall attivo"}'
fi
