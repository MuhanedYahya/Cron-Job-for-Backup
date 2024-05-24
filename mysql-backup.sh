#!/bin/bash
#
MYSQL_PASSWORD="YOUR_PASSWORD"
MYSQL_USERNAME="USERNAME"
LOG_FILE="LOG_PATH"
OUTPUT_FILE="/home/admin/database_backups/backup_$(date +\%Y-\%m-\%d_\%H_\%M).sql"
LOG_FILE="/home/admin/backup_logs/backup_$(date +\%Y-\%m-\%d_\%H_\%M).log"
echo "======================================================" >> $LOG_FILE
echo "Starting backup - $(date +%F) ..." >> $LOG_FILE
if sudo mysqldump -u$MYSQL_USERNAME -p$MYSQL_PASSWORD event_tap > $OUTPUT_FILE 2>> $LOG_FILE; then
        echo "backup succeeded." >> $LOG_FILE
        if [ "$(ls -1 ~/database_backups/ |wc -l)" == 4 ]
          then  
                cd ~/database_backups/; 
                ls -1t | tail -n 1 | xargs rm -rf; 
        fi
        if [ "$(ls -1 ~/backup_logs/ |wc -l)" == 4 ]
          then  
                cd ~/backup_logs/; 
                ls -1t | tail -n 1 | xargs rm -rf; 
        fi
else
        echo "We could not get a backup from the event_tap database" >> $LOG_FILE;
fi
