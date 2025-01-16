#!/bin/bash
showit () {
    echo -e "[$1$2\e[0m]\t${@:3}\e[0m"
}

docit () {
    showit "\e[0;32m" $@
}

badit () {
    showit "\e[0;31m" $@
}

for var in "$@"
do
    docit "Name" "${var}"
    path_out="$(command -v $var)"
    if [[ -n $path_out ]]
    then 
        if [[ -e $path_out ]]
        then
            docit "Path" "${path_out}"
        else
            docit "Buildtin" "${path_out}"
        fi
    else
        badit "Undefined" "${var}"
    fi

    if [[ -n "$(command -v rpm)" ]]
    then
        path_out="$(rpm -q $var)"
        docit "RPM-installed" "${path_out}"
        docit "RPM-relies-on" ""
        rpm -q --whatrequires $var
        docit "/RPM-relies-on" ""
    fi

    if [[ -n "$(command -v flatpak)" ]]
    then
        docit "FlatPak" ""
        flatpak info $(flatpak list --app --columns name,application | grep -i --colour=never "${var}" | grep --colour=never -o $'\w*\.\w*\.\w*') 2> /dev/null
        docit "/Flatpak" ""
    fi

    echo

done