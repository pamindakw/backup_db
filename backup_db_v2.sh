# Generate timestamp in YYYY-MM-DD-HH-MM format
TIMESTAMP=$(date +"%Y-%m-%d-%H-%M")

# Create database backup from the container
# Connects as root user and exports all databases to a timestamped SQL file
docker exec db_container_name sh -c "database-dump -u root -username@password" > /opt/backups/${TIMESTAMP}-backup.sql

# Upload the backup file to Google Drive using gdrive CLI tool
/usr/local/bin/gdrive files upload /opt/backups/${TIMESTAMP}-backup.sql

# Clean up old backups: delete files older than 2 days
# Excludes the backup.sh script itself from deletion
find /opt/backups/ -type f -mtime +2 ! -name 'backup_db.sh' -delete
