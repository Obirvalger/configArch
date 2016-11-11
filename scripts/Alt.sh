#! /usr/bin/sh

/usr/bin/qemu-system-x86_64 \
    -monitor stdio \
    -soundhw ac97 \
    -machine accel=kvm \
    -m 4096 \
    -full-screen \
    -hda /home/ogneslav/.aqemu/Alt_HDA.img \
    -boot once=c,menu=on \
    -net nic,vlan=0 \
    -net user,vlan=0 \
    -rtc base=localtime \
    -name "Alt" \
    -display sdl \
    -cpu host
