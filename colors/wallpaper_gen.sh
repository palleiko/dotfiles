#!/bin/bash
. $HOME/colors/b16_theme.conf
WALLPAPER_FILE=$HOME/colors/b16_wallpaper.png
RES=$(xdpyinfo | egrep -o "[0-9]+x[0-9]+ pixels" | sed 's/ pixels//')
X_RES=$(echo "$RES" | cut -dx -f1)
Y_RES=$(echo "$RES" | cut -dx -f2)
X_BS=$(($X_RES))
Y_BS=$(($Y_RES))


echo "$RES" "$X_RES" "$Y_RES"

convert -size $RES  xc:"$BASE02" \
	-fill "$BASE08" -draw "rectangle 200,600 400,700" \
	-fill "$BASE09" -draw "rectangle 400,600 600,700" \
	-fill "$BASE0A" -draw "rectangle 600,600 800,700" \
	-fill "$BASE0B" -draw "rectangle 800,600 1000,700" \
	-fill "$BASE0D" -draw "rectangle 1000,600 1200,700" \
	-fill "$BASE0E" -draw "rectangle 1200,600 1400,700" $WALLPAPER_FILE
feh --bg-fill $WALLPAPER_FILE
