#!/bin/sh

# Music
sh $HOME/.dotfiles/autostart/initmusic.sh 1> /dev/null

# Radio
radiotray 1> /dev/null &
