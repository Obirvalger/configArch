#synclient TouchpadOff=1
#guake &
xbacklight = 30
xset s off -dpms
compton -zfc -D5 -e 0.9 -m 0.85 --shadow-blue 0.1 &
feh --bg-scale ~/.config/.background 
conky -dc .config/conkyrc
sleep 0.5
#transset-df .8 -n conky
conky -c .config/conkyrccal &
sleep 0.5
transset-df .8 -n conky
#killall mate-screensaver 
setxkbmap -layout "us,ru(winkeys)" -model "pc105" -option "grp:alt_shift_toggle" &
xxkb &
#killall ibus-daemon
lxterminal &
#firefox &
#yandex-disk start
#stardict -h &
