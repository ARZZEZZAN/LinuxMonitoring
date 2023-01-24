#!/bin/bash

# Set color codes
white='\033[0;37m'
red='\033[0;31m'
green='\033[0;32m'
blue='\033[0;34m'
purple='\033[0;35m'
black='\033[0;30m'
nc='\033[0m'


bg_value_names=$color1
font_value_names=$color2
bg_values=$color3
font_values=$color4


HOSTNAME=$(hostname)
echo -e "\033[48;5;${bg_value_names}m\033[38;5;${font_value_names}mHOSTNAME\033[0m: \033[48;5;${bg_values}m\033[38;5;${font_values}m$HOSTNAME\033[0m"
# echo -e "${green}HOSTNAME${nc}: $HOSTNAME"
# Get Timezone
TIMEZONE=$(timedatectl | grep "Time zone" | awk '{print $3}')
UTC=$(date +%z)
echo -e "\033[48;5;${bg_value_names}m\033[38;5;${font_value_names}mTIMEZONE\033[0m: \033[48;5;${bg_values}m\033[38;5;${font_values}m$TIMEZONE UTC $UTC\033[0m"

# Get Current User
USER=$(whoami)
echo -e "\033[48;5;${bg_value_names}m\033[38;5;${font_value_names}mUSER\033[0m: \033[48;5;${bg_values}m\033[38;5;${font_values}m$USER\033[0m"

# Get OS Type and Version
OS=$(lsb_release -a | grep Description | awk '{print $2, $3}')
echo -e "\033[48;5;${bg_value_names}m\033[38;5;${font_value_names}mOS\033[0m: \033[48;5;${bg_values}m\033[38;5;${font_values}m$OS\033[0m"

# Get Current Time
DATE=$(date '+%d %B %Y %T')
echo -e "\033[48;5;${bg_value_names}m\033[38;5;${font_value_names}mDATE\033[0m: \033[48;5;${bg_values}m\033[38;5;${font_values}m$DATE\033[0m"

# Get Uptime
UPTIME=$(uptime -p)
UPTIME_SEC=$(uptime | awk '{print $3}' | sed 's/,//g')
echo -e "\033[48;5;${bg_value_names}m\033[38;5;${font_value_names}mUPTIME\033[0m: \033[48;5;${bg_values}m\033[38;5;${font_values}m$UPTIME\033[0m"
echo -e "\033[48;5;${bg_value_names}m\033[38;5;${font_value_names}mUPTIME_SEC\033[0m: \033[48;5;${bg_values}m\033[38;5;${font_values}m$UPTIME_SEC\033[0m"

# Get IP, Mask and Gateway
IP=$(ifconfig | grep "inet " | awk '{print $1, $2}')
MASK=$(ifconfig | grep "netmask" | awk '{print $2, $3, $4}')
GATEWAY=$(ip route | grep default | awk '{print $3}')
echo -e "\033[48;5;${bg_value_names}m\033[38;5;${font_value_names}mIP\033[0m: \033[48;5;${bg_values}m\033[38;5;${font_values}m$IP\033[0m"
echo -e "\033[48;5;${bg_value_names}m\033[38;5;${font_value_names}mMASK\033[0m: \033[48;5;${bg_values}m\033[38;5;${font_values}m$MASK\033[0m"
echo -e "\033[48;5;${bg_value_names}m\033[38;5;${font_value_names}mGATEWAY\033[0m: \033[48;5;${bg_values}m\033[38;5;${font_values}m$GATEWAY\033[0m"

# Get RAM Information
RAM_TOTAL=$(free -h | grep Mem | awk '{print $2}')
RAM_USED=$(free -h | grep Mem | awk '{print $3}')
RAM_FREE=$(free -h | grep Mem | awk '{print $4}')
echo -e "\033[48;5;${bg_value_names}m\033[38;5;${font_value_names}mRAM_TOTAL\033[0m: \033[48;5;${bg_values}m\033[38;5;${font_values}m$RAM_TOTAL\033[0m"
echo -e "\033[48;5;${bg_value_names}m\033[38;5;${font_value_names}mRAM_USED\033[0m: \033[48;5;${bg_values}m\033[38;5;${font_values}m$RAM_USED\033[0m"
echo -e "\033[48;5;${bg_value_names}m\033[38;5;${font_value_names}mRAM_FREE\033[0m: \033[48;5;${bg_values}m\033[38;5;${font_values}m$RAM_FREE\033[0m"

# Get Root Partition Information
SPACE_ROOT=$(df -h / | awk '{print $2}' | tail -1)
SPACE_ROOT_USED=$(df -h / | awk '{print $3}' | tail -1)
SPACE_ROOT_FREE=$(df -h / | awk '{print $4}' | tail -1)
echo -e "\033[48;5;${bg_value_names}m\033[38;5;${font_value_names}mSPACE_ROOT\033[0m: \033[48;5;${bg_values}m\033[38;5;${font_values}m$SPACE_ROOT\033[0m"
echo -e "\033[48;5;${bg_value_names}m\033[38;5;${font_value_names}mSPACE_ROOT_USED\033[0m: \033[48;5;${bg_values}m\033[38;5;${font_values}m$SPACE_ROOT_USED\033[0m"
echo -e "\033[48;5;${bg_value_names}m\033[38;5;${font_value_names}mSPACE_ROOT_FREE\033[0m: \033[48;5;${bg_values}m\033[38;5;${font_values}m$SPACE_ROOT_FREE\033[0m"
