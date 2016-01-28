#! /bin/bash

conky -c ~/.config/conky/sysinfo &
sleep 0.2
transset-df -n conky 0.75
conky -c ~/.config/conky/calendar &
#for x in $(xwininfo -all -root | grep conky | grep -Po '0x[0-9a-e]+'); do transset-df -i $x 0.8; done
