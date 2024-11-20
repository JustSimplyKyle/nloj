#!/bin/bash

# Set path to your project directory
BACKUP_DIR="/home/cdx-user/tioj"
BACKUP_FILE="backup.sql"

# Change to project directory
cd "$BACKUP_DIR" || exit 1

# Perform database backup
if mysqldump -u root -p'nlhs' tioj_production > "$BACKUP_FILE"; then
    # Git operations
    git add "$BACKUP_FILE"
    git add td
    git add public
	git add db_backup.sh
    git commit -m "feat: database-update"
    git pull
    git push
fi
