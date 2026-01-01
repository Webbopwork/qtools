#!/bin/bash

say_thing() {
    echo "${1}"
    notify-send "${1}"
}

start_message() {
    say_thing "Installation of NVIDIA drivers started, please wait"
}

end_message() {
    say_thing "Installation of NVIDIA drivers finished, please reboot PC"
}

no_third_party_message() {
    say_thing "Couldn't find the package, this could be because third-party repositories are not enabled"
}

if [ -n "$(command -v rpm-ostree)" ]; then
    if [ -n "$(rpm-ostree search akmod-nvidia | grep -F "akmod-nvidia" -o)" ]; then
        start_message
        sudo rpm-ostree install akmod-nvidia xorg-x11-drv-nvidia-cuda
        sudo rpm-ostree kargs --append=rd.driver.blacklist=nouveau --append=modprobe.blacklist=nouveau --append=nvidia-drm.modeset=1
        end_message
    else
        no_third_party_message
    fi
elif [ -n "$(command -v dnf)" ]; then
    if [ -n "$(dnf search akmod-nvidia | grep -F "akmod-nvidia" -o)" ]; then
        start_message
        sudo dnf install akmod-nvidia xorg-x11-drv-nvidia-cuda
        end_message
    else
        no_third_party_message
    fi
else
    say_thing "Couldn't start because neither \"dnf\" or \"rpm-ostree\" are installed, are you sure that this is Fedora Linux?"
fi