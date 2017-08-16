#!/bin/sh
mute=`amixer -c 0 get Master | grep Mono:`
echo $mute
