#!/bin/bash
stat=`synclient | grep "TouchpadOff" | cut -d\= -f2`
if [ $stat -eq 0 ]; then
    synclient TouchpadOff=1 ;
    notify-send "Touchpad" "Touchpad disabled"
else
    synclient TouchpadOff=0 ;
    notify-send "Touchpad" "Touchpad enabled"
fi
