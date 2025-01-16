#!/bin/bash

echo -ne "\033]0;CheckTemp\007"

echo  -e "CheckTemp - Bash program made by Webbop in 2024 \n\nThis program will show you your OS recorded device temperatures in fixed time increments, please specify them under here.\n"
read -n 4 -p 'Measurement update wait time in whole seconds: ' WAIT_TIME

if [[ $WAIT_TIME =~ [^0-9] ]] || [ -z $WAIT_TIME ]
  then
    echo -e "\nSorry whole seconds (integers) only, reverting to the standard 5 seconds."
    echo "Press any key to continue..."
	read -s -n 1
    WAIT_TIME=5
fi

echo -e "\nThe status will be updated every $WAIT_TIME seconds. Ctrl+C will stop the program.\n"
echo "Press any key to begin monitoring..."
read -s -n 1

temp_src=$(find /sys/class/thermal/thermal_zone*/temp | wc -l)
while true
do
	clear
	echo -e "Following is the measured temperature in mili-celsius:\n"
	for (( c=0; c<=temp_src-1; c++ ))
	do
		echo "$c: $(</sys/class/thermal/thermal_zone$c/temp) m℃"
	done
	sleep $WAIT_TIME
done