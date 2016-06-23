#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?* ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# merge in Xresources
[[ -f ~/.config/x11/Xresources ]] && xrdb -I$HOME -merge ~/.config/x11/Xresources

# make Caps Lock be control when held and Esc when tapped
setxkbmap -option 'caps:ctrl_modifier'
xcape -e 'Caps_Lock=Escape'

# disable clicks and scrolling while typing
syndaemon -t -k -i 1 &

# enable screen blanking
xset +dpms &
xset dpms 0 0 180 &

# Autostart
sh $HOME/.dotfiles/autostart.sh

# color temperature adjustment, set for Gdańsk
redshift-gtk &

exec i3 -V >> $HOME/.i3logs/$(date +'%F-%k-%M-%S') 2>&1
