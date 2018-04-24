#!/bin/bash
. $HOME/colors/b16_theme.conf

color="$BASE08"

WINDOW=$(xdotool getwindowfocus getwindowname | sed 's/\\//g' | sed 's/\"/\\\"/g')
echo -ne "{ \"full_text\" : \"$WINDOW\","
echo -ne "\"color\" : \"$color\","
echo -ne "\"align\" : \"left\","
echo -ne "\"separator\" : false },\n"
