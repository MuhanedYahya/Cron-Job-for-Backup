#!/bin/bash
if docker exec c9879aba6c91 /bin/bash ./backup_from_container.sh; then
    if docker cp c9879aba6c91:/backup/my_wiki_database.sql /root/backups/;
    then
	    mv /root/backups/database_name.sql /root/backups/database_name_$(date +%F).sql;
	    if [ "$(ls -1 /root/backups/ |wc -l)" == 4 ]
	   	 then
       			cd /root/backups; 
       			ls -1t | tail -n 1 | xargs rm -rf;
	    fi
    else 
	    echo "Attention ! Error in backup transfer, you need to check" >> /root/backup-transfer-error.txt;	   
    fi 
else
	echo "We could not get a backup from the container named Database_Container_ID" > /root/backup-generate-error.txt;
fi