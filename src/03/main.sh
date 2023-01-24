#!/bin/bash


if [ $# != 4 ]; then
  echo "Please provide 4 parameters: background color of value names, font color of value names, background color of values, and font color of values"
	exit 1
else
	export color1=$1
	export color2=$2
	export color3=$3
	export color4=$4
fi

for i in $color1 $color2 $color3 $color4; do
	if [[ $i < 1 || $i > 6 ]]; then
	echo "Please enter numbers from 1 to 6."
	exit 1
	fi
done

if [ $color1 -eq $color2 ] || [ $color3 -eq $color4 ]
then
    echo "Background and font color values must not match. Please run the script again with different values."
    exit 1
fi

chmod +x colorHandler.sh
./colorHandler.sh