# make Caps Lock be control when held and Esc when tapped
setxkbmap -option 'caps:ctrl_modifier'
xcape -e 'Caps_Lock=Escape'

# music
sh $HOME/.dotfiles/autostart.sh

exec i3 -V >> $HOME/.i3logs/$(date +'%F-%k-%M-%S') 2>&1
