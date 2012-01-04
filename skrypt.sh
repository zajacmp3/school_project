#!/bin/sh

echo "Choose file/folder that you want to backup"
read file
echo "Do backup [1]Local or [2]Remote"
read letter
echo "Choose method of backup"
echo "[1].ZIP [2].TAR.GZ"
read method
NOWDATE=`date +%d%m%y`

if [ $method -eq 2 ]; then
tar -cvzf /usr/backup/$NOWDATE.tar.gz $file
fi
if [ $method -eq 1 ]; then
zip -R /usr/backup/$NOWDATE.zip $file
fi
echo Packing complete
if [ $letter -eq 2 ]; then
if [ $method -eq 1 ]; then
ftp -n -i infug.net78.net <<EOF
user a4860405 haslo6
put /usr/backup/$NOWDATE.zip $NOWDATE.zip
!
EOF
fi
if [ $method -eq 2 ]; then
ftp -n -i infug.net78.net <<EOF
user a4860405 haslo6
put /usr/backup/$NOWDATE.tar.gz $NOWDATE.tar.gz
!
EOF
fi
fi
if [ $letter -eq 1 ]; then
echo "Choose your backup folder"
read folder
mv /usr/backup/$NOWDATE.tar.gz &folder
fi
#mysqldump --user=root --password=Creative6 wordpress >/usr/backup/$NOWDATE.sql
#clear
#clear
#wput /usr/backup/$NOWDATE.sql ftp://admin@infugskrypt.cba.pl:haslo@infugskrypt.cba.pl/
#clear
echo COMPLETE
