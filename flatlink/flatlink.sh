#!/bin/bash
if [[ -n $1 ]]; then
	if [[ -n $2 ]]; then
		alias ${1}="flatpak run ${2}"
		echo ${1}="flatpak run ${2}"
	elif [[ $1 =~ "." ]]; then
		GREP_PART=$(flatpak list --app --columns name,application | grep -Fwi --colour=never "${1}" | grep --colour=never -o $'^[^\t]*')
		if [[ -n $GREP_PART ]]; then
			GREP_PART=${GREP_PART// /_}="flatpak run ${1}"
			alias "${GREP_PART}"
			echo $GREP_PART
		fi
	else
		GREP_PART=$(flatpak list --app --columns name,application | grep -Fwi --colour=never "${1}" | grep --colour=never -o $'\w*\.\w*\.\w*')
		if [[ -n $GREP_PART ]]; then
			GREP_PART=${1// /_}="flatpak run ${GREP_PART}"
			alias "${GREP_PART}"
			echo $GREP_PART
		fi
	fi
fi
