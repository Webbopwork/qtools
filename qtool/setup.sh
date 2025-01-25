#!/bin/bash
qtool() {
	if [[ -n $1 ]]; then
		CODE=$(curl -s "https://raw.githubusercontent.com/Webbopwork/qtools/refs/heads/main/${1}/${1}.sh")
		if [[ "${CODE}" != "404: Not Found" ]]; then
			source <(curl -s "https://raw.githubusercontent.com/Webbopwork/qtools/refs/heads/main/${1}/${1}.sh") ${@:2}
		fi
	fi
}

export -f qtool
