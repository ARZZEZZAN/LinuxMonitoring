#!/bin/bash

# Get Hostname
HOSTNAME=$(hostname)
echo "HOSTNAME: $HOSTNAME"

# Get Timezone
TIMEZONE=$(timedatectl | grep "Time zone" | awk '{print $3}')
UTC=$(date +%z)
echo "TIMEZONE: $TIMEZONE UTC $UTC"

# Get Current User
USER=$(whoami)
echo "USER: $USER"

# Get OS Type and Version
OS=$(lsb_release -a | grep Description | awk '{print $2, $3}')
echo "OS: $OS"

# Get Current Time
DATE=$(date '+%d %B %Y %T')
echo "DATE: $DATE"

# Get Uptime
UPTIME=$(uptime -p)
UPTIME_SEC=$(uptime | awk '{print $3}' | sed 's/,//g')
echo "UPTIME: $UPTIME"
echo "UPTIME_SEC: $UPTIME_SEC"

# Get IP, Mask and Gateway
IP=$(ifconfig | grep "inet " | awk '{print $1, $2}')
MASK=$(ifconfig | grep "netmask" | awk '{print $2, $3, $4}')
GATEWAY=$(ip route | grep default | awk '{print $3}')
echo "IP: $IP"
echo "MASK: $MASK"
echo "GATEWAY: $GATEWAY"

# Get RAM Information
RAM_TOTAL=$(free -h | grep Mem | awk '{print $2}')
RAM_USED=$(free -h | grep Mem | awk '{print $3}')
RAM_FREE=$(free -h | grep Mem | awk '{print $4}')
echo "RAM_TOTAL: $RAM_TOTAL"
echo "RAM_USED: $RAM_USED"
echo "RAM_FREE: $RAM_FREE"

# Get Root Partition Information
SPACE_ROOT=$(df -h / | awk '{print $2}' | tail -1)
SPACE_ROOT_USED=$(df -h / | awk '{print $3}' | tail -1)
SPACE_ROOT_FREE=$(df -h / | awk '{print $4}' | tail -1)
echo "SPACE_ROOT: $SPACE_ROOT"
echo "SPACE_ROOT_USED: $SPACE_ROOT_USED"
echo "SPACE_ROOT_FREE: $SPACE_ROOT_FREE"

chmod +x save_to_file.sh
bash save_to_file.sh "$HOSTNAME" "$TIMEZONE" "$USER" "$OS" "$DATE" "$UPTIME" "$UPTIME_SEC" "$IP" "$MASK" "$GATEWAY" "$RAM_TOTAL" "$RAM_USED" "$RAM_FREE" "$SPACE_ROOT" "$SPACE_ROOT_USED" "$SPACE_ROOT_FREE"