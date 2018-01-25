#!/bin/bash
files="$(ls base16-i3/colors/)"

for i in $files; do
   cat base16-i3/colors/$i | sed 's/^.....//g' | sed -n '6,21p' | sed 's/\( #......\)/="\1"/g' | sed 's/ //g' > $i

done

