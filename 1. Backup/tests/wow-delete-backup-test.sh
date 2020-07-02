#!/bin/bash


####################################################################
#
#   Script Name: wow-delete-backup-test.sh
#
#   Author: Cymor
#
#   Description: A script to test the delete script
#
######################################################################################
#
#   Version: 1.0.0 - Initial release
#
######################################################################################

# For eachdaymonth
for month in $(seq -w 01 12)
do 
    # for each day
    for day in $(seq -w 01 31)
    do 
        mkdir -p test/2020/$month/$day

        # create test files
        for fileName in abc def hij
        do 
            touch --date="2020/$month/$day" test/2020/$month/$day/$fileName.sql.gz
        done 
    done 
done