#!/bin/bash

. $HOME/colors/b16_theme.conf

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
	VOL_COLOR="$BASE02"
elif [[ $VOL -eq 0 ]]; then
	VOL_ICON="$OFF"
	VOL_COLOR="$BASE02"
elif [[ $VOL -le 40 ]]; then
	VOL_ICON="$LOW"
	VOL_COLOR="$BASE04"
else
	VOL_ICON="$FULL"
	VOL_COLOR="#969696"
fi
echo -ne "{ \"full_text\" : \"$VOL_ICON $VOL%\","
echo -ne "\"color\" : \"$VOL_COLOR\","
echo -ne "\"min_width\" : \"______\","
echo -ne "\"separator\" : false },\n"
