#!/bin/bash
CONFIG_DIR="$HOME/.config/"
I3CONFIG_FILE="$HOME/.config/i3/config"
CONKY_DIR="$CONFIG_DIR/conky/"
SCRIPTS="bat_output.sh current_window.sh load_output.sh vol_output.sh"
THEME_FILE="$HOME/colors/b16_theme.conf"
THEME_DIR="$HOME/colors/themes/"
XRESOURCES_FILE="$HOME/.Xresources"
XRESOURCES_THEME_DIR="$HOME/colors/themes/base16-xresources/xresources/"
VIMRC="$HOME/.vimrc"
THEME="$1"

set_i3config() {
	sed -i "s/set \$black.*$/set \$black $base00/g" $I3CONFIG_FILE
	sed -i "s/set \$grey.*$/set \$grey $base02/g" $I3CONFIG_FILE
	sed -i "s/set \$lightgrey.*$/set \$lightgrey $base01/g" $I3CONFIG_FILE 
	sed -i "s/set \$yellow.*$/set \$yellow $base0A/g" $I3CONFIG_FILE
	sed -i "s/set \$red.*$/set \$red $base08/g" $I3CONFIG_FILE
	sed -i "s/set \$purple.*$/set \$purple $base0E/g" $I3CONFIG_FILE
	sed -i "s/set \$orange.*$/set \$orange $base09/g" $I3CONFIG_FILE
	sed -i "s/set \$blue.*$/set \$blue $base0D/g" $I3CONFIG_FILE
	sed -i "s/set \$white.*$/set \$white $base05/g" $I3CONFIG_FILE
}
generate_theme_file() {
	echo "######################" > $THEME_FILE
	echo "# Theme set to $THEME" >> $THEME_FILE
	echo "######################" >> $THEME_FILE
	echo "BASE00=\"$base00\"" >> $THEME_FILE
	echo "BASE01=\"$base01\"" >> $THEME_FILE
	echo "BASE02=\"$base02\"" >> $THEME_FILE
	echo "BASE03=\"$base03\"" >> $THEME_FILE
	echo "BASE04=\"$base04\"" >> $THEME_FILE
	echo "BASE05=\"$base05\"" >> $THEME_FILE
	echo "BASE06=\"$base06\"" >> $THEME_FILE
	
	echo "BASE08=\"$base08\"" >> $THEME_FILE
	echo "BASE09=\"$base09\"" >> $THEME_FILE
	echo "BASE0A=\"$base0A\"" >> $THEME_FILE
	echo "BASE0B=\"$base0B\"" >> $THEME_FILE
	echo "BASE0C=\"$base0C\"" >> $THEME_FILE
	echo "BASE0D=\"$base0D\"" >> $THEME_FILE
	echo "BASE0E=\"$base0E\"" >> $THEME_FILE
	
	echo "BASE07=\"$base07\"" >> $THEME_FILE
	echo "BASE0F=\"$base0F\"" >> $THEME_FILE

}
set_Xresources() {
	if [[ ! -f $XRESOURCES_FILE ]]; then
		echo "error: No '$XRESOURCES_FILE' file found..." >&2
		exit 1
	fi
	if [[ ! -d $XRESOURCES_THEME_DIR ]]; then
		echo "No Xresources themes found... Cloning from Github."
		cd $THEME_DIR
		git clone "https://github.com/chriskempson/base16-xresources"
		cd -
	fi
	
	sed -e '/^!!START/,/^!!END/d' $XRESOURCES_FILE > $XRESOURCES_FILE.old
	rm $XRESOURCES_FILE
	touch $XRESOURCES_FILE
	while read line; do 
		if echo $line | grep "^!!THEME" > /dev/null; then
			x_theme=$(basename $THEME | sed 's/\.config$/-256\.Xresources/')
			echo -ne "!!THEME\n!!START\n" >> $XRESOURCES_FILE
			cat $XRESOURCES_THEME_DIR$x_theme >> $XRESOURCES_FILE
			echo "!!END" >> $XRESOURCES_FILE
		else
			echo $line >> $XRESOURCES_FILE
		fi
	done < $XRESOURCES_FILE.old
	rm $XRESOURCES_FILE.old
	xrdb -merge $XRESOURCES_FILE
}
set_bashrc() {
	b16_theme=$(basename $THEME | sed "s/^base16-/base16_/" | sed "s/\.config//")
	sed -i "s/^base16.*$/$b16_theme/" $HOME/.bashrc
	source $HOME/.bashrc 2> /dev/null
}
conky_color_replace() {
	. $THEME_FILE
	cp $CONKY_DIR/conkyrc $CONKY_DIR/conkyrc_template
	echo "" > $CONKY_DIR/conkyrc
	# This defines colors used for Conky => i3bar
	#             DASH   |       WIRELESS NETWORK      |       WIRED NETWORK         |   DATE  |  TIME
	color_list=("$BASE02" "$BASE0B" "$BASE0B" "$BASE0B" "$BASE0B" "$BASE0B" "$BASE0B" "$BASE03" "$BASE05")

	i=0
	while read -r line; do
		if echo $line | grep '"color"' > /dev/null; then
			color=${color_list[$i]}
			echo "$line" | sed -e "s/#.*\"/$color\"/" >> $CONKY_DIR/conkyrc
			((i++))
		else
		   echo "$line" >> $CONKY_DIR/conkyrc
		fi
	 done < $CONKY_DIR/conkyrc_template
	 sed -i '/^# Theme set to ''$/d' $CONKY_DIR/conkyrc
	rm $CONKY_DIR/conkyrc_template
}


if [[ "$1" ]]; then
	if [[ -f "$1"  ]]; then
		. "$THEME"
		echo "Setting theme to '$THEME'"
		generate_theme_file
		set_i3config
		conky_color_replace
		set_Xresources
		set_bashrc
		./wallpaper_gen.sh

		i3 restart 2> /dev/null
		echo "Done."

	else
	   echo "Error: Invalid path to theme." >&2
	fi
else
   echo -e "Error: Please specify a theme." >&2
   echo -e "   Usage: './set_theme.sh path/to/theme'" >&2
fi
