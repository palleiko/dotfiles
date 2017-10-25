#!/bin/bash
WINDOW=$(xdotool getwindowfocus getwindowname | sed 's/"/\\"/g')
echo -n "$WINDOW"
