#!/bin/bash

# Backup script configuration
SOURCE_DIR="$1"                   # Source directory to back up
BACKUP_DIR="$2"                   # Destination for backups
BACKUP_FREQUENCY="$3"             # Backup frequency (daily, weekly, etc.)
RETENTION_DAYS=7                  # Retention period for backups
LOG_FILE="/var/log/backup.log"    # Log file for backup operations

# Function to log messages
log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

# Function to perform backup
perform_backup() {
    TIMESTAMP=$(date '+%Y%m%d_%H%M%S')
    BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

    tar -czf "$BACKUP_FILE" "$SOURCE_DIR" && \
    log_message "Backup successful: $BACKUP_FILE" || \
    log_message "Backup failed: $SOURCE_DIR"
}

# Function to cleanup old backups
cleanup_old_backups() {
    find "$BACKUP_DIR" -type f -name "*.tar.gz" -mtime +$RETENTION_DAYS -exec rm {} \;
    log_message "Old backups cleaned up."
}

# Check if the source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    log_message "Source directory does not exist: $SOURCE_DIR"
    exit 1
fi

# Perform backup
perform_backup

# Cleanup old backups
cleanup_old_backups

# Send email notification (optional)
# echo "Backup completed for $SOURCE_DIR" | mail -s "Backup Status" user@example.com
