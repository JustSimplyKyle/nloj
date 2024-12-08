#!/bin/bash

# Set path to your project directory
BACKUP_DIR="/home/cdx-user/tioj"
BACKUP_FILE="/home/cdx-user/nloj-backup/backup.sql"

# Change to project directory
cd "$BACKUP_DIR" || exit 1

# Perform database backup
if mysqldump -u root -p'nlhs' tioj_production > "$BACKUP_FILE"; then
    git pull
    git add td
    git add public
	git add db_backup.sh
    git commit -m "feat: database-update"
    git push
    cd /home/cdx-user/nloj-backup/
    git pull
    git add backup.sql
    git commit -m "feat: database-update"
    git push
fi
