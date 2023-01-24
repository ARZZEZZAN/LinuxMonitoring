#!/bin/bash

# Get Hostname
HOSTNAME=$(hostname)

# Get Timezone
TIMEZONE=$(timedatectl | grep "Time zone" | awk '{print $3}')
UTC=$(date +%z)

# Get Current User
USER=$(whoami)

# Get OS Type and Version
OS=$(lsb_release -d | awk '{print $2, $3}')

# Get Current Time
DATE=$(date '+%d %B %Y %T')

# Get Uptime
UPTIME=$(uptime -p)
UPTIME_SEC=$(uptime | awk '{print $3}' | sed 's/,//g')

# Get IP, Mask and Gateway
IP=$(ip route get 1 | awk '{print $NF;exit}')
MASK=$(ifconfig | grep "netmask" | awk '{print $4}')
GATEWAY=$(ip route | grep default | awk '{print $3}')

# Get RAM Information
RAM_TOTAL=$(sysctl -a | awk '/hw./' | '/mem/'| grep Mem | awk '{print $2}')
RAM_USED=$(sysctl -a | awk '/hw./' | '/mem/'| grep Mem | awk '{print $3}')
RAM_FREE=$(sysctl -a | awk '/hw./' | '/mem/'| grep Mem | awk '{print $4}')

# Get Root Partition Information
SPACE_ROOT=$(df -h / | awk '{print $2}' | tail -n 1)
SPACE_ROOT_USED=$(df -h / | awk '{print $3}' | tail -n 1)
SPACE_ROOT_FREE=$(df -h / | awk '{print $4}' | tail -n 1)

# Output all


