#!/bin/bash

# Set default relative time to 40 hours if no argument is provided
relative_time="${1:-40}"

# Define log file name
log_file="deleted-files-$(date +'%d-%m-%Y').log"

# Clean audio files older than specified time and generate log
find /data/audios/ -type f -name "*.wav" -mmin +$((relative_time * 60)) -exec sh -c 'echo "$(basename "{}") $(stat -c "%y" "{}") $(date +"%Y-%m-%dT%H:%M:%S%:z")"' \; >> "$log_file" -exec rm {} \;
