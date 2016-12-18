#! /bin/sh

xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto

#exec startkde
exec startlxqt
#exec openbox-session
#exec xmonad
