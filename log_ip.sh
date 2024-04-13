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

# Get the current IP address
IP_ADDRESS=$(curl -s --proto =https https://checkip.amazonaws.com)

# Log the IP address along with the timestamp
# This creates the file if it doesn't already exist; if the file exists, it will append to it
echo "$TIMESTAMP - $IP_ADDRESS" >> $LOG_FILE

# Set applicable permissions
if [ -f $LOG_FILE ]; then
    chmod 700 $LOG_FILE
fi
