#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

alias connect-airpods='
# Trova il MAC degli AirPods cercando il nome “AirPods” o “AirPods Pro”
MAC=$(bluetoothctl devices | grep -i "AirPods" | awk "{print \$2}" | head -n1)

if [ -z "$MAC" ]; then
  echo "AirPods non trovati. Mettili in modalità pairing e riprova."
  exit 1
fi

echo "Collegando AirPods con MAC: $MAC..."

bluetoothctl <<EOF
power on
agent on
default-agent
scan on
sleep 5
pair $MAC
trust $MAC
connect $MAC
scan off
exit
EOF

# Imposta A2DP su PipeWire
pactl set-card-profile bluez_card.${MAC//:/_} a2dp_sink

echo "AirPods collegati e profilo A2DP impostato."
'
