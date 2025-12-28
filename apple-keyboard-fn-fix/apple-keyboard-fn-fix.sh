#!/bin/bash

sudo echo "2" >> /sys/module/hid_apple/parameters/fnmode
sudo echo "options hid_apple fnmode=2" > /etc/modprobe.d/hid_apple.conf

USING_DRACUT=$(command -v dracut)
if [ -n "$USING_DRACUT" ]; then
    echo "Is using dracut" 
    sudo echo "install_items+=/etc/modprobe.d/hid_apple.conf" > /etc/dracut.conf.d/hid_apple.conf
    sudo dracut --force
fi