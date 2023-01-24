#!/bin/bash

hostname=$1
timezone=$2
user=$3
os=$4
date=$5
uptime=$6
uptime_sec=$7
ip=$8
mask=$9
gateway=$10
ram_total=$11
ram_used=$12
ram_free=$13
space_root=$14
space_root_used=$15
space_root_free=$16

# Ask user if they want to save the information to a file
read -p "Do you want to save the information to a file? (Y/N) " saveToFile

# Check if user wants to save the information to a file
if [ "$saveToFile" == "Y" ] || [ "$saveToFile" == "y" ]; then
  # Get current time for file name
  currentTime=$(date '+%d_%m_%Y_%H_%M_%S')

  # Create file name
  fileName="$currentTime.status"

  # Write information to file
  echo "HOSTNAME: $hostname" >> $fileName
  echo "TIMEZONE: $timezone UTC $UTC" >> $fileName
  echo "USER: $user" >> $fileName
  echo "OS: $os" >> $fileName
  echo "DATE: $date" >> $fileName
  echo "UPTIME: $uptime" >> $fileName
  echo "UPTIME_SEC: $uptime_sec" >> $fileName
  echo "IP: $ip" >> $fileName
  echo "MASK: $mask" >> $fileName
  echo "GATEWAY: $gateway" >> $fileName
  echo "RAM_TOTAL: $ram_total" >> $fileName
  echo "RAM_USED: $ram_used" >> $fileName
  echo "RAM_FREE: $ram_free" >> $fileName
  echo "SPACE_ROOT: $space_root" >> $fileName
  echo "SPACE_ROOT_USED: $space_root_used" >> $fileName
  echo "SPACE_ROOT_FREE: $space_root_free" >> $fileName
  echo "Information saved to $fileName"
else
  echo "Information not saved to a file."
fi