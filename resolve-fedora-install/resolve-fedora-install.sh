#!/bin/bash

#Install DaVinci Resolve
if [ $# -eq 0 ] ; then
	echo "User error: No arguments provided" >&2
	echo "Please make the first argument the path to the DaVinci Resolve .run installer file."
	return 1
elif [ ! -e "${1}" ]; then
	echo "User error: First argument provided is not a existing path" >&2
	echo "Please make the first argument the path to the DaVinci Resolve .run installer file."
	return 2
elif [ ! -f "${1}" ]; then
	echo "User error: First argument provided is not a file path" >&2
	echo "Please make the first argument the path to the DaVinci Resolve .run installer file."
	return 2
elif [ ! -x "${1}" ]; then
	echo "User error: First argument provided is not a executable file path" >&2
	echo "Please make the first argument the path to the DaVinci Resolve .run installer file. The file has to have it's permission set to allow it to be executed."
	return 2
fi
SKIP_PACKAGE_CHECK=1 "${1}"

#Fix it post-install
if [ $? -ne 0 ]; then
	echo "Process error: Installer exited with non-success exit code $?" >&2
	return 126
if [ -d "/opt/resolve/libs" ]; then
	#Credit to https://github.com/H3rz3n/Davinci-Resolve-Fedora-38-39-40-Fix for this part
	cd /opt/resolve/libs
	sudo mkdir disabled-libraries
	sudo mv libglib* disabled-libraries
	sudo mv libgio* disabled-libraries
	sudo mv libgmodule* disabled-libraries
	return 0
else
	echo "Process error: Path '/opt/resolve/libs' was not generated or is not present" >&2
	return 126
fi
