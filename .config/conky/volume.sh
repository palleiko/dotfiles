#!/bin/sh
vol=`amixer -c 0 get Master | grep Mono: | cut -d "[" -f2 | cut -d "%" -f1`
echo $vol
