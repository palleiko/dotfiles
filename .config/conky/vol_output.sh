#!/bin/bash

. $HOME/colors/theme

mute=`amixer -c 0 get Master | grep Mono:`
mute=`echo "${mute}" | cut -d'[' -f4`

if [ "${mute}" = "off]" ]; then
	mute=1
else
	mute=0
fi

VOL=$(amixer -c 0 get Master | grep Mono: | cut -d "[" -f2 | cut -d "%" -f1)

OFF="\uf026"
LOW="\uf027"
FULL="\uf028"

if [[ $mute -eq 1 ]];then
	VOL_ICON="$OFF"
	VOL_COLOR="#666666"
elif [[ $VOL -eq 0 ]]; then
	VOL_ICON="$OFF"
	VOL_COLOR="#666666"
elif [[ $VOL -le 40 ]]; then
	VOL_ICON="$LOW"
	VOL_COLOR="#969696"
else
	VOL_ICON="$FULL"
	VOL_COLOR="#969696"
fi
echo -n "{ \"full_text\" : \"$VOL_ICON $VOL%\","
echo -n "\"color\" : \"$VOL_COLOR\","
echo -n "\"min_width\" : \"______\","
echo -n "\"separator\" : false },"
echo
