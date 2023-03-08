#!/bin/sh

source .env

USER=${1:-$MYSQL_BACKUP_USER}
PASS=${2:-$MYSQL_BACKUP_PASS}
DESTINATION=${3:-$MYSQL_BACKUP_DESTINATION}
RECIPIENT_EMAIL=${4:-$MYSQL_BACKUP_RECIPIENT_EMAIL}
KEEP_DAYS=${5:-$MYSQL_BACKUP_KEEP_DAYS}

sqlfile=$DESTINATION/all-database-$(date +%d-%m-%Y_%H-%M-%S).sql
zipfile=$DESTINATION/all-database-$(date +%d-%m-%Y_%H-%M-%S).zip

# Create a backup
sudo mysqldump -u $USER -p$PASS --all-databases > $sqlfile
if [ $? == 0 ]; then
  echo 'Sql dump created'
else
  echo 'mysqldump return non-zero code' | mailx -s 'No backup was created!' $RECIPIENT_EMAIL
  exit
fi

# Compress backup
zip $zipfile $sqlfile
if [ $? == 0 ]; then
  echo 'The backup was successfully compressed'
else
  echo 'Error compressing backup' | mailx -s 'Backup was not created!' $RECIPIENT_EMAIL
  exit
fi
rm $sqlfile

# Delete old backups
find $DESTINATION -mtime +$KEEP_DAYS -delete