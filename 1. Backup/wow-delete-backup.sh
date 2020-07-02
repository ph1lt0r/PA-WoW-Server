#!/bin/bash


######################################################################################
#
#   Script Name: wow-delete-backup.sh
#
#   Author: Cymor
#
#   Description: used to delete old backups of the three databases for a docker WoW server
#
######################################################################################
#
#   Version: 1.0.0 - Initial release
#
######################################################################################

# Define the database names in an array for processing, database IP, and folder structure for backups
backupRoot="$HOME/db-backups"

year=$(date "+%Y")
month=$(date "+%B")
day=$(date "+%d")
hour=$(date "+%H")

deleteAfter="3 months"

listToDelete=$(find $backupRoot -type f -name "*.sql.gz")

# delete the databases in the array
for fileToDelete in listToDelete
do
    dirToDelete=$(echo $fileToDelete | awk -F'/' '{print $last}')
    rm $fileToDelete
    rmdir $dirToDelete
    if month dir empty, delete
    if year dir empty, delete
        rmdir 
done

mysqldump -uroot -ppassword -h$dbIP > \/$backupRoot\/$year\/$month\/$day\/"$hour:00 - $db.sql"

# Delete directory structure of backup folder
if [ -d $backupRoot\/$year\/$month\/$day ]
then
    rmdir $backupRoot\/$year\/$month\/$day
fi