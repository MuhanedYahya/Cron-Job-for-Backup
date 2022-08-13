# Cron Job for docker container Backup
Here, the script was written to take backup from mysql docker container and transfer it to the host automatically and when the number of these backups is 4, delete the oldest backup and always have 3 backups.


###Attention !
**backup_from_container.sh ** this file must be placed in container
####Notes:
```
$(date +%F)
```
this will print today's date
```
$(ls -1 /root/backups/ |wc -l)
```
will print the number of backups on this host
```
ls -1t | tail -n 1 | xargs rm -rf;
```
will sort the backups on this host by date added and delete the oldest