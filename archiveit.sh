#!/bin/bash
# moves a bunch of bzipped files that start with year and month in filename,
# creates a folder for previous months, and moves them there.
# useful for archiving "last months daily backups" into a folder.

year=`date +%Y`
this_month=`date +%m`
last_month=$((this_month-1))
if [ $last_month -eq 0 ]; then
    last_month='01'
    year=$((year-1))
fi

# month digit must be two chars long (01, 02, 03, etc.)
if [ $last_month -lt 10 ]; then
    last_month=0$last_month
fi

folder=$year$last_month
if [ ! -d $folder ]; then
    echo 'generating folder '$folder
    mkdir $folder
fi

echo 'moving files ...'
for i in $(ls $folder*.bz); do
    #echo $i
    mv $i $folder/
done

echo 'done!'
