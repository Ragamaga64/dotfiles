#!/bin/bash

status=$(sudo /usr/bin/ufw status | head -n1)

if [[ $status == *"active"* ]]; then
    echo '{"text":"","class":"active"}'
else
    echo '{"text":"","class":"inactive"}'
fi
