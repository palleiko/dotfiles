#!/bin/bash

########################################
# This script will do dope shit
########################################

RED="#cc6666"
ORANGE="#de935f"
YELLOW="#f0c674"
GREEN="#b5bd68"
GREY="#666666"

MIN="\\uf244"
LOW="\\uf243"
MID="\\uf242"
HIGH="\\uf241"
FULL="\\uf240"
PLUGGED="\\uf1e6"

bat="Battery 0: "
acpi_out="$(acpi)"
acpi_out="${acpi_out#$bat}"
acpi_out=$(echo ${acpi_out} | sed 's/,.*//')
if [[ "${acpi_out}" = "Charging" ]]; then 
	BAT0_CHARGING=1
else
	BAT0_CHARGING=0
fi

acpi_out=$(acpi | grep "Battery 1:")
# acpi_out="${acpi_out#$bat}"
acpi_out=$(echo ${acpi_out} | sed 's/,.*//' | sed 's/ //g' | cut -d: -f2)
if [[ "${acpi_out}" = "Charging" ]]; then 
	BAT1_CHARGING=1
else
	BAT1_CHARGING=0
fi
BAT0_PERC=$(acpi | grep "Battery 0: " | cut -d, -f2 | sed 's/[^0-9]*//g')
BAT1_PERC=$(acpi | grep "Battery 1: " | cut -d, -f2 | sed 's/[^0-9]*//g')

if [[ $BAT0_CHARGING -eq 1 ]]; then
	BAT0_ICON="$PLUGGED"
	BAT0_COLOR="$GREEN"
#	echo "plugged"
else
	if [ $BAT0_PERC -le 20 ]; then
		BAT0_ICON="$MIN"
		BAT0_COLOR="$RED"
	elif [ $BAT0_PERC -gt 20 -a $BAT0_PERC -le 40 ]; then
		BAT0_ICON="$LOW"
		BAT0_COLOR="$ORANGE"
	elif [ $BAT0_PERC -gt 40 -a $BAT0_PERC -le 70 ]; then
		BAT0_ICON="$MID"
		BAT0_COLOR="$YELLOW"
	elif [ $BAT0_PERC -gt 70 -a $BAT0_PERC -le 85 ]; then
		BAT0_ICON="$HIGH"
		BAT0_COLOR="$YELLOW"
	elif [ $BAT0_PERC -gt 85 ]; then
		BAT0_ICON="$FULL"
		BAT0_COLOR="$GREEN"
	fi
fi
if [ $BAT1_CHARGING -eq 1 ]; then
	BAT1_ICON="$PLUGGED"
	BAT1_COLOR="$GREEN"
else
	if [ $BAT1_PERC -le 20 ]; then
		BAT1_ICON="$MIN"
		BAT1_COLOR="$RED"
	elif [ $BAT1_PERC -gt 20 -a $BAT1_PERC -le 40 ]; then
		BAT1_ICON="$LOW"
		BAT1_COLOR="$ORANGE"
	elif [ $BAT1_PERC -gt 40 -a $BAT1_PERC -le 70 ]; then
		BAT1_ICON="$MID"
		BAT1_COLOR="$YELLOW"
	elif [ $BAT1_PERC -gt 70 -a $BAT1_PERC -le 85 ]; then
		BAT1_ICON="$HIGH"
		BAT1_COLOR="$YELLOW"
	elif [ $BAT1_PERC -gt 85 ]; then
		BAT1_ICON="$FULL"
		BAT1_COLOR="$GREEN"
	fi
fi
echo -n "{ \"full_text\" : \"$BAT0_ICON $BAT0_PERC% \","
echo -n "\"color\" : \"$BAT0_COLOR\","
echo -n "\"min_width\" : \"__\","
echo -n "\"separator\" : false },"
echo
echo -n "{ \"full_text\" : \"$BAT1_ICON $BAT1_PERC% \","
echo -n "\"color\" : \"$BAT1_COLOR\","
echo -n "\"min_width\" : \"__\","
echo -n "\"separator\" : false },"
echo ""
