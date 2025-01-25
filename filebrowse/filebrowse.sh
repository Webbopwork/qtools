#!/bin/bash

BOLD=$'\033[1m'
RED=$'\033[0;31m'
GREEN=$'\033[0;32m'
LIGHT_BLUE=$'\033[1;34m'
NC=$'\033[0m' # No Color

target_dir="$(pwd)"

echo -ne "\033]0;FileBrowse: ${target_dir}\007"

echo "${LIGHT_BLUE}Hello!${NC}"

while :; do
	ls -a "${target_dir}"
	read -e -p "${BOLD}${target_dir}: ${NC}" target_path
	clear
	if [[ "$target_path" =~ ^///* ]]; then
		echo "${LIGHT_BLUE}Command detected${NC}"
		case $target_path in
		//terminal)
			gnome-terminal --working-directory="$target_dir"
			#exit 1
			;;
		///terminal)
			gnome-terminal --working-directory="$target_dir"
			;;
		//open)
			ls -a "${target_dir}"
			read -e -p "File name: " file_name
			xdg-open $file_name
			;;
		///open)
			ls -a "${target_dir}"
			read -e -p "File name: " file_name
			xdg-open $file_name
			;;
		//run)
			ls -a "${target_dir}"
			read -e -p "File name: " file_name
			"${target_dir}/${file_name}"
			;;
		//file)
			ls -a "${target_dir}"
			read -e -p "File name: " file_name
			echo ""
			file $file_name
			echo ""
			;;
		//hex)
			ls -a "${target_dir}"
			read -e -p "File name: " file_name
			echo ""
			hexdump -C "${file_name}"
			echo ""
			;;
		//clear) ;;
		//exit)
			exit 1
			;;
		///exit)
			exit 1
			;;
		esac
	elif [ -e "${target_path}" ]; then
		if [ -d "${target_path}" ]; then
			cd "${target_path}"
			target_dir="$(pwd)"
			echo -ne "\033]0;FileBrowse: ${target_dir}\007"
		else
			echo "${GREEN}File content: ${NC}"
			printf "$(<$target_path)"
			echo $'\n'
		fi
	else
		echo "${RED}Path not found: ${NC}${BOLD}${target_path}${NC}"
		#Maybe it is a command?
	fi
done
