#!/bin/bash

backupDir='/var/minecraft/backups'
currentDate=$(date +%b-%d-%Y-%H%M%Z)

for sqlDatabase in $(mysql -Be 'show databases' | grep -Ev 'Database|mysql|*_schema|khavalon_*')
do
  mysqldump --databases $sqlDatabase --lock-tables=false | gzip > $backupDir/asthonia-$sqlDatabase-$currentDate.sql.gz
  aws --profile default s3 cp --no-progress $backupDir/asthonia-$sqlDatabase-$currentDate.sql.gz s3://asthonia-prod-backups-sql/
  rm -f $backupDir/asthonia-$sqlDatabase-$currentDate.sql.gz
done

find /var/minecraft/asthonia -name "*.jar" > tempignore.txt
echo "/var/minecraft/asthonia/plugins/squaremap/web/tiles/" >> tempignore.txt

for world in $(ls /var/minecraft/asthonia/worlds/)
do
  tar --exclude-from=tempignore.txt --warning=no-file-changed -czpf $backupDir/asthonia-$world-$currentDate.tar.gz  /var/minecraft/asthonia/worlds/$world
  aws --profile default s3 cp --no-progress $backupDir/asthonia-$world-$currentDate.tar.gz s3://asthonia-prod-backups-server/
  rm -f $backupDir/asthonia-$world-$currentDate.tar.gz
done

tar --exclude-from=tempignore.txt --warning=no-file-changed -czpf $backupDir/asthonia-plugins-$currentDate.tar.gz  /var/minecraft/asthonia/plugins
aws --profile default s3 cp --no-progress $backupDir/asthonia-plugins-$currentDate.tar.gz s3://asthonia-prod-backups-server/
rm -f $backupDir/asthonia-plugins-$currentDate.tar.gz

aws --profile default s3 ls s3://asthonia-prod-backups-server | while read -r remoteBackup
do
  if [[ $(date -d $(echo $remoteBackup | awk '{ print $1 }') +%s) > $(date -d "$(date) - 30 days" +%s) ]]
    then
      aws --profile default s3 rm s3://asthonia-prod-backups-server/$(echo $remoteBackup | awk '{ print $4 }')
    fi
done

aws --profile default s3 ls s3://asthonia-prod-backups-sql| while read -r remoteBackup
do
  if [[ $(date -d $(echo $remoteBackup | awk '{ print $1 }') +%s) > $(date -d "$(date) - 30 days" +%s) ]]
    then
      aws --profile default s3 rm s3://asthonia-prod-backups-sql/$(echo $remoteBackup | awk '{ print $4 }')
    fi
done

rm -f tempignore.txt
