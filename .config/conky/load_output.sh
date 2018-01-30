#!/bin/bash

. $HOME/colors/b16_theme.conf

MEM_PERC=$(echo "(`free | grep Mem | awk '{print $3/$2 * 100}'`+0.5)/1" | bc )
cpu_info=$(top -d 0.5 -b -n2 | grep "Cpu"|tail -n 4 )
CPU_PERC=$(echo "$(echo "$cpu_info" | awk '{print $2 + $4}')")
CPU_PERC=$(echo $CPU_PERC | sed 's/\n/+/g' | sed 's/ /+/g' | bc)
CPU_PERC=$(echo "$CPU_PERC/4" | bc)

RED="$BASE08"
ORANGE="$BASE09"
YELLOW="$BASE0A"
GREEN="$BASE0B"
GREY="$BASE03"

# echo "MEM: $MEM_PERC, CPU: $CPU_PERC"

if [ $MEM_PERC -le 40 ]; then
	MEM_COLOR="$GREY"
elif [ $MEM_PERC -gt 40 -a $MEM_PERC -le 70 ]; then
	MEM_COLOR="$YELLOW"
elif [ $MEM_PERC -gt 70 -a $MEM_PERC -le 85 ]; then
	MEM_COLOR="$ORANGE"
elif [ $MEM_PERC -gt 85 ]; then
	MEM_COLOR="$RED"
fi

if [ $CPU_PERC -le 40 ]; then
	CPU_COLOR="$GREY"
elif [ $CPU_PERC -gt 40 -a $CPU_PERC -le 70 ]; then
	CPU_COLOR="$YELLOW"
elif [ $CPU_PERC -gt 70 -a $CPU_PERC -le 85 ]; then
	CPU_COLOR="$ORANGE"
elif [ $CPU_PERC -gt 85 ]; then
	CPU_COLOR="$RED"
fi
echo -n "{ \"full_text\" : \"MEM: $MEM_PERC% \","
echo -n "\"color\" : \"$MEM_COLOR\","
echo -n "\"min_width\" : \"_________\","
echo -n "\"separator\" : false },"
echo
echo -n "{ \"full_text\" : \"CPU: $CPU_PERC% \","
echo -n "\"color\" : \"$CPU_COLOR\","
echo -n "\"min_width\" : \"_________\","
echo -n "\"separator\" : false },"
echo ""

