#!/bin/bash
if rm -f backup/*;then
   if mysqldump -uroot -p1234 database_name > backup/database_name.sql;then
	echo true;
   else 
	echo false;
   fi
else
   echo false;
fi