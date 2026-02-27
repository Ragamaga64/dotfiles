#!/bin/bash

# Controlla se firewalld è attivo
if systemctl is-active --quiet firewalld; then
    echo "󰛤 Firewall ON"  # icona "scudo" nerd font
else
    echo "󰛤 Firewall OFF"
fi
