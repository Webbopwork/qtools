#!/bin/bash
clear
echo "Mic2Speaker"
echo "By CatWithCode"
echo "Slightly modified by Webbop (arg1 is source, arg2 is sink, otherwise default source)"
echo ""
read -p "CHECK THE MIC VOLUME!!! THEN PRESS THE ANY-KEY!"
echo ""
echo "ID:"
if [ -z $1 ]
then 
    pactl load-module module-loopback #latency_msec=1
else 
    if [ -z $2 ]
    then
        pactl load-module module-loopback source="${1}"
    else
        pactl load-module module-loopback source="${1}" sink="${2}"
    fi
fi
echo ""
read -p "Press the Any-Key to Stop & Exit"
pactl unload-module module-loopback