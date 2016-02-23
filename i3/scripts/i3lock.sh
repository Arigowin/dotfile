#!/usr/bin/env bash
# i3 lock script: pixelates screen and adds lock icon
# requires imagemagick and scrot

icon="$HOME/Pictures/lockscreen.png"
tmpbg="/tmp/lockscreen.png"
text="/tmp/locktext.png"
luminositer=$(light -G)
light -S 10

# pause notifications
killall -SIGUSR1 dunst

# get image
scrot "$tmpbg"
convert "$tmpbg" -scale 10% -scale 1000% -fill black -colorize 25% "$tmpbg"

# add lock icon
if [ -f "$icon" ]; then
    convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"
fi


# add text
 [ -f $text ] || {
     convert -size 3000x60 xc:white -font Meslo-LG-S-Regular-for-Powerline -pointsize 26 -fill black -gravity center -annotate +0+0 'Type password to unlock' $text;
     convert $text -alpha set -channel A -evaluate set 50% $text;
 }
convert $tmpbg $text -gravity center -geometry +0+200 -composite $tmpbg

# lock, don't fork (to work with xss-lock)
i3lock -n -e -i "$tmpbg"
light -S $luminositer

# resume notifications
killall -SIGUSR2 dunst
