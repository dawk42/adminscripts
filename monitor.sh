#!/bin/bash
wdir="$HOME/.screenlayout"
file="${wdir}/layout.sh"
install -m 700 -d $wdir
install -m 755 /dev/null $file
declare -a condisp=($(xrandr | grep -w connected | awk '{print $1}'))
mon1=${condisp[0]}
mon2=${condisp[1]}

ord1="xrandr --output $mon1 --output $mon2 --right-of $mon1"
ord2="xrandr --output $mon2 --output $mon1 --right-of $mon2"

declare -a monord=("$ord1" "$ord2")

for i in ${!monord[*]}; do
    ${monord[$i]}
    read -p "Are the monitors arranged correctly? Y/N: " opt
    if [[ ${opt:0:1} == [Yy] ]]; then
        echo "Setting monitor order in $file"
        echo "${monord[$i]}" > "$file"
        break
    else
        echo "Testing next setting"
    fi
done
