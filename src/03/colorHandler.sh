#!/bin/bash

# Set color codes
white="\033[107m"
red="\033[0;31m"
green="\033[42m"
blue="\033[44m"
purple="\033[45m"
black="\033[40m"

mass[0]=$color1
mass[1]=$color2
mass[2]=$color3
mass[3]=$color4


for i in 0 1 2 3; do
	if [[ ${mass[$i]} == 1 ]]; then
		mass[$i]=$white
	elif [[ ${mass[$i]} == 2 ]]; then
		mass[$i]=$red
	elif [[ ${mass[$i]} == 3 ]]; then
		mass[$i]=$green
	elif [[ ${mass[$i]} == 4 ]]; then
		mass[$i]=$blue
	elif [[ ${mass[$i]} == 5 ]]; then
		mass[$i]=$purple
	elif [[ ${mass[$i]} == 6 ]]; then
		mass[$i]=$black
	fi
done

bg_value_names=${mass[0]}
font_value_names=${mass[1]}
bg_values=${mass[2]}
font_values=${mass[3]}
HOSTNAME=$(hostname)
echo -e "${bg_value_names}${font_value_names}HOSTNAME\033[0m: ${bg_values}${font_values}$HOSTNAME\033[0m"
# echo -e "${green}HOSTNAME${nc}: $HOSTNAME"
# Get Timezone
TIMEZONE=$(timedatectl | grep "Time zone" | awk '{print $3}')
UTC=$(date +%z)
echo -e "${bg_value_names}${font_value_names}TIMEZONE\033[0: ${bg_values}${font_values}$TIMEZONE UTC $UTC\033[0m"

# Get Current User
USER=$(whoami)
echo -e " ${bg_value_names}${font_value_names}USER\033[0m:  ${bg_values}${font_values}$USER\033[0m"

# Get OS Type and Version
OS=$(lsb_release -a | grep Description | awk '{print $2, $3}')
echo -e " ${bg_value_names}${font_value_names}OS\033[0m:  ${bg_values}${font_values}$OS\033[0m"

# Get Current Time
DATE=$(date '+%d %B %Y %T')
echo -e " ${bg_value_names}${font_value_names}DATE\033[0m:  ${bg_values}${font_values}$DATE\033[0m"

# Get Uptime
UPTIME=$(uptime -p)
UPTIME_SEC=$(uptime | awk '{print $3}' | sed 's/,//g')
echo -e " ${bg_value_names}${font_value_names}UPTIME\033[0m:  ${bg_values}${font_values}$UPTIME\033[0m"
echo -e " ${bg_value_names}${font_value_names}UPTIME_SEC\033[0m:  ${bg_values}${font_values}$UPTIME_SEC\033[0m"

# Get IP, Mask and Gateway
IP=$(ifconfig | grep "inet " | awk '{print $1, $2}')
MASK=$(ifconfig | grep "netmask" | awk '{print $2, $3, $4}')
GATEWAY=$(ip route | grep default | awk '{print $3}')
echo -e " ${bg_value_names}${font_value_names}IP\033[0m:  ${bg_values}${font_values}$IP\033[0m"
echo -e " ${bg_value_names}${font_value_names}MASK\033[0m:  ${bg_values}${font_values}$MASK\033[0m"
echo -e " ${bg_value_names}${font_value_names}GATEWAY\033[0m:  ${bg_values}${font_values}$GATEWAY\033[0m"

# Get RAM Information
RAM_TOTAL=$(free -h | grep Mem | awk '{print $2}')
RAM_USED=$(free -h | grep Mem | awk '{print $3}')
RAM_FREE=$(free -h | grep Mem | awk '{print $4}')
echo -e " ${bg_value_names}${font_value_names}RAM_TOTAL\033[0m:  ${bg_values}${font_values}$RAM_TOTAL\033[0m"
echo -e " ${bg_value_names}${font_value_names}RAM_USED\033[0m:  ${bg_values}${font_values}$RAM_USED\033[0m"
echo -e " ${bg_value_names}${font_value_names}RAM_FREE\033[0m:  ${bg_values}${font_values}$RAM_FREE\033[0m"

# Get Root Partition Information
SPACE_ROOT=$(df -h / | awk '{print $2}' | tail -1)
SPACE_ROOT_USED=$(df -h / | awk '{print $3}' | tail -1)
SPACE_ROOT_FREE=$(df -h / | awk '{print $4}' | tail -1)
echo -e " ${bg_value_names}${font_value_names}SPACE_ROOT\033[0m:  ${bg_values}${font_values}$SPACE_ROOT\033[0m"
echo -e " ${bg_value_names}${font_value_names}SPACE_ROOT_USED\033[0m:  ${bg_values}${font_values}$SPACE_ROOT_USED\033[0m"
echo -e " ${bg_value_names}${font_value_names}SPACE_ROOT_FREE\033[0m:  ${bg_values}${font_values}$SPACE_ROOT_FREE\033[0m"
