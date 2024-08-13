#!/usr/bin/env bash

originDir="/path/to/the/watched/directory/"
destinationDir="/path/to/the/destination/directory/"
logfile="/path/to/your/logfile"

# Logging the backup
currentTime=$(date +"%T")
echo "Database backup started at $currentTime , Making a backup!" >> "$logfile"

# Taking the backup
rsync -avz $originDir $destinationDir --delete >> "$logfile"

echo "Backup Complete!" >> "$logfile"