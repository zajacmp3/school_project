#!/bin/sh

echo "Choose file/folder that you want to backup"
read file
echo "Do backup [1]Local or [2]Remote"
read letter
if [ $letter -eq 2 ]; then
echo "Please insert your FTP data"
echo "FTP HOST:"
read host
echo "USERNAME"
read username
echo "PASSWORD"
read password
fi
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
ftp -n -i $host <<EOF
user $username $password
put /usr/backup/$NOWDATE.zip $NOWDATE.zip
!
EOF
fi
if [ $method -eq 2 ]; then
ftp -n -i $host <<EOF
user $username $password
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
echo COMPLETE

#Test host infug.net78.net
#Test username a4860405
#Test password haslo6
