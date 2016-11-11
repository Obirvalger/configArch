#! /usr/bin/sh

/usr/bin/qemu-system-x86_64 \
    -monitor stdio \
    -smp 4,threads=2 \
    -soundhw ac97 \
    -vga qxl \
    -machine accel=kvm \
    -m 5120 \
    -full-screen \
    -hda /home/ogneslav/.aqemu/Zorin_HDA.img \
    -boot once=c,menu=off \
    -net nic,vlan=0 \
    -net user,vlan=0 \
    -rtc base=utc \
    -no-frame \
    -name "Zorin" \
    -display sdl \
    -cpu host
