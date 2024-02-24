ubuntu@ip-172-31-30-43:~/OKay/Managing-Disk-Space$ cat clean_audio.sh
#!/bin/bash

# Set default relative time to 40 hours if no argument is provided
relative_time="${1:-40}"

# Define log file name
log_file="deleted-files-$(date +'%d-%m-%Y').log"

# Clean audio files older than specified time and generate log
find /data/audios/ -type f -name "*.wav" -mmin +$((relative_time * 60)) -print0 |
while IFS= read -r -d '' file; do
    creation_time=$(stat -c '%y' "$file")
    deletion_time=$(date +'%Y-%m-%dT%H:%M:%S%:z')
    echo "$(basename "$file") $creation_time $deletion_time" >> "$log_file"
    rm "$file"
done
