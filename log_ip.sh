#!/bin/bash

# Set the path to the source directory and log file
SOURCE_DIR=
LOG_FILE=

# Create SOURCE_DIR if it doesn't exist
if [ ! -d $SOURCE_DIR ]; then
    mkdir -p $SOURCE_DIR
    chmod 700 $SOURCE_DIR
fi

# Get the current date and time
TIMESTAMP=$(date +"%Y-%m-%d %T")

# Get the current IPv6 address via curl
IPv6=$(curl -s -6 --proto =https https://ifconfig.me/ip)

# It is also possible to obtain the globally routable IPv6 address(s) including the prefix length via the ip command:
# ip -6 addr show scope global | grep -o 'inet6 [^ ]*' | awk '{print $2}'

# Get the current outbound IPv4 address
IPv4=$(curl -s -4 --proto =https https://ifconfig.me/ip)

# Log the IP addresses along with the timestamp
# This creates the file if it doesn't already exist; if the file exists, it will append to it
echo "$TIMESTAMP : $IPv6 - $IPv4 " >> $LOG_FILE

# Set applicable permissions
if [ -f $LOG_FILE ]; then
    chmod 700 $LOG_FILE
fi
