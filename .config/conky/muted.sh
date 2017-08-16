#!/bin/sh
mute=`amixer -c 0 get Master | grep Mono:`
mute=`echo "${mute}" | cut -d'[' -f4`

if [ "${mute}" = "off]" ]; then
	echo 0
fi
