#!/bin/bash


######################################################################################
#
#   Script Name: wow-delete-backup.sh
#
#   Author: Cymor
#
#   Description: used to delete old backups of the three databases for a docker WoW server. I could have done it with one find command, but I wanted to allow for the directories being created at different times.
#
######################################################################################
#
#   Version: 1.0.0 - Initial release
#
######################################################################################

# define vars
backupRoot="$HOME/db-backups"
deleteOlderThan=90 # days

echo "Deleting"

# delete the databases past the limit
find $backupRoot -type f -mtime +$deleteOlderThan -delete -print

# recursively delete empty dirs
find $backupRoot/ -type d -empty -delete

echo "Done"