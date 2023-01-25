#! /bin/bash

if [ $# != 0 ]; then
	echo "Please don't provide parameters: background color of value names, font color of value names, background color of values, and font color of values"
else
	source colors.txt
	export color1=$column1_background
	export color2=$column1_font_color
	export color3=$column2_background
	export color4=$column2_font_color

for i in $color1 $color2 $color3 $color4; do
	if [[ $i < 1 || $i > 6 ]]; then
	echo "Please enter numbers from 1 to 6."
	exit 1
	fi
done

	chmod +x colorHandler.sh
	./colorHandler.sh
fi
