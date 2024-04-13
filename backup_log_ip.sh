#!/bin/bash

# Set the path to the source directory, destination directory and log file
SOURCE_DIR=
DEST_DIR=
LOG_FILE=

# Create SOURCE_DIR if it doesn't exist
if [ ! -d $SOURCE_DIR ]; then
    mkdir -p $SOURCE_DIR
    chmod 700 $SOURCE_DIR
fi

# Create DEST_DIR if it doesn't exist
if [ ! -d $DEST_DIR ]; then
    mkdir -p $DEST_DIR
    chmod 700 $DEST_DIR
fi

# Create LOG_FILE if it doesn't exist
if [ ! -e $LOG_FILE ]; then
    touch $LOG_FILE
    chmod 700 $LOG_FILE
fi

# Get current date and time
DATE=$(date +"%Y-%m-%d_%H-%M-%S")

# Rotate the log file and backup to the destination directory
if [ -e $LOG_FILE ]; then
  # Rename the existing log file with timestamp
  mv $LOG_FILE $SOURCE_DIR/ip_address_$DATE.log
  # Copy to destination directory
  cp $SOURCE_DIR/ip_address_$DATE.log $DEST_DIR/ip_address_$DATE.log
  # Create new log file
  touch $SOURCE_DIR/ip_address.log
  # Set applicable permissions
  chmod 700 $SOURCE_DIR/ip_address.log
fi

