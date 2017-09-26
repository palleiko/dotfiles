#!/bin/bash

PERC=`acpi | cut -d, -f2- | cut -d% -f1`

RED="\#cc6666"
ORANGE="\#de935f"
YELLOW="\#f0c674"
GREEN="\#b5db68"
echo $PERC
if [ "$PERC" -gt 0 -a "$PERC" -le 25 ]; then
	printf "$RED"
fi
if [ "$PERC" -gt 25 -a "$PERC" -le 50 ]; then
	printf "$ORANGE"
fi
if [ "$PERC" -gt 50 -a "$PERC" -le 80 ]; then
	printf "$YELLOW"
fi
if [ "$PERC" -gt 80 -a "$PERC" -le 100 ]; then
	printf "$GREEN"
fi
