#!/bin/bash

# Round
PERC=$(echo "(`free | grep Mem | awk '{print $3/$2 * 100}'`+0.5)/1" | bc )

# Trunkate
#PERC=$(printf "%.0f" `free | grep Mem | awk '{print $3/$2 * 100}'`)

RED="cc6666"
ORANGE="de935f"
YELLOW="f0c674"
GREY="666666"
# Debug echo 
# echo $PERC

if [ "$PERC" -gt 0 -a "$PERC" -le 50 ]; then
	printf "$GREY"
elif [ "$PERC" -gt 50 -a "$PERC" -le 80 ]; then
	printf "$ORANGE"
elif [ "$PERC" -gt 80 -a "$PERC" -le 100 ]; then
	printf "$RED"
fi
