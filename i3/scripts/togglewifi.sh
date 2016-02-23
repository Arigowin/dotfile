#!/bin/bash

status=$(nmcli r wifi)
if [ $status = "enabled" ] ; then
    nmcli r wifi off
    notify-send "Wireless" "Wireless disabled"
else
    nmcli r wifi on
    notify-send "Wireless" "Wireless enabled"
fi
exit 0
