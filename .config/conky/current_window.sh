#!/bin/bash
. $HOME/colors/theme

color=$RED
WINDOW=$(xdotool getwindowfocus getwindowname | sed 's/\\//g' | sed 's/\"/\\\"/g')
echo -n "{ \"full_text\" : \"$WINDOW\","
echo -n "\"color\" : \"$color\","
echo -n "\"align\" : \"left\","
echo -n "\"separator\" : false },"
