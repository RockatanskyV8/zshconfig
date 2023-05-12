#!/bin/bash

# Check if pattern and destination folder were passed as arguments
if [ $# -ne 2 ]; then
    echo "Usage: $0 <pattern> <destination_folder>"
    exit 1
fi

# Assign arguments to variables
PATTERN=$1
DESTINATION=$2

# Use rg to count the number of matching files
COUNT=$(rg -c "$PATTERN" | awk -F ':' '{ sum += $2 } END { print sum }')

# Check if number of occurencies is greater than zero
if ! [ $COUNT -gt 0 ]; then
    echo "No files matching the pattern were found."
    exit 1
fi

# Check if destination folder exists and create it if necessary
if [ ! -d "$DESTINATION" ]; then
    echo "Destination folder does not exist. Creating..."
    mkdir -p "$DESTINATION"
fi

# Use rg and awk to generate mv commands for matching files
rg -l "$PATTERN" | awk -v dest="$DESTINATION" '{print "mv \""$0"\" "dest}' | sh
