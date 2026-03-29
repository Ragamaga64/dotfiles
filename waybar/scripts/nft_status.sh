#!/bin/bash

if sudo /usr/sbin/nft list ruleset 2>/dev/null | grep -q "hook input"; then
    # Firewall attivo
    echo '{"text": "","class":"active","tooltip":"Firewall attivo"}'
else
    # Firewall inattivo
    echo '{"text": "","class":"inactive","tooltip":"Firewall inattivo"}'
fi
