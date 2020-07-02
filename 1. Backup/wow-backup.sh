#!/bin/bash


######################################################################################
#
#   Script Name: wow-backup.sh
#
#   Author: Ph1Lt0r
#
#   Description: used to backup the three databases for a docker WoW server
#
######################################################################################
#
#   Version: 1.0.0 - Initial release
#
######################################################################################

# Define the database names in an array for processing, database IP, and folder structure for backups
dbNames[0]="acore_auth"
dbNames[1]="acore_world"
dbNames[2]="acore_characters"
dbIP="172.27.0.2"
backupRoot="$HOME/db-backups"
year=$(date "+%Y")
month=$(date "+%B")
day=$(date "+%d")
hour=$(date "+%H")

# Create directory structure of backup folder
if [ ! -d $backupRoot\/$year\/$month\/$day ]
then
    mkdir -p $backupRoot\/$year\/$month\/$day
fi

# backup the databases in the array
for db in "${dbNames[@]}"
do
    mysqldump -uroot -ppassword -h$dbIP | gzip > \/$backupRoot\/$year\/$month\/$day\/"$hour:00 - $db.sql.gz"
done