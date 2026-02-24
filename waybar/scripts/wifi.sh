#!/bin/bash

# Nome corretto del device Wi-Fi
DEVICE="wlp3s0"

# Controlla se è connesso
STATUS=$(iwctl station $DEVICE show | grep 'Connected network' | cut -d':' -f2 | xargs)

if [ -z "$STATUS" ]; then
    echo "睊 Disconnesso"  # Icona Wi-Fi disconnesso
else
    echo "直 $STATUS"    # Icona Wi-Fi connesso + SSID
fi

