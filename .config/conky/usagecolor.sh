#!/bin/bash

# Round
PERC=$(echo "(`free | grep Mem | awk '{print $3/$2 * 100}'`+0.5)/1" | bc )

# Trunkate
#PERC=$(printf "%.0f" `free | grep Mem | awk '{print $3/$2 * 100}'`)

RED="\#cc6666"
ORANGE="\#de935f"
YELLOW="\#f0c674"
GREEN="\#b5db68"

# Debug echo 
# echo $PERC


if [ "$PERC" -gt 0 -a "$PERC" -le 25 ]; then
	printf "$GREEN"
fi
if [ "$PERC" -gt 25 -a "$PERC" -le 50 ]; then
	printf "$YELLOW"
fi
if [ "$PERC" -gt 50 -a "$PERC" -le 80 ]; then
	printf "$ORANGE"
fi
if [ "$PERC" -gt 80 -a "$PERC" -le 100 ]; then
	printf "$RED"
fi
