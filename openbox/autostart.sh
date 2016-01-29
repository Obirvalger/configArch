#synclient TouchpadOff=1
#guake &
xset s off -dpms
xbacklight = 30
compton -zfc -D10 -m 0.85 --shadow-blue 0.1 &
feh --bg-scale ~/.config/.background 
lxterminal &
sleep 0.2
~/.config/conky/conky.sh
#killall mate-screensaver 
setxkbmap -layout "us,ru(winkeys)" -model "pc105" -option "grp:alt_shift_toggle" &
xxkb &
#killall ibus-daemon
#firefox &
yandex-disk start
#stardict -h &
