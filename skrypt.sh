#!/bin/sh

echo "Wybierz folder/plik kt�rego kopi� chcesz wykona�"
read file
echo "Wybierz opcj� kopii [1]lokalnie/[2]zewn�trznie"
read letter
NOWDATE=`date +%d%m%y`
tar -cvzf /usr/backup/$NOWDATE.tar.gz $file
echo Packing complete
if [ $letter -eq 2 ]; then
ftp -n -i infug.net78.net <<EOF
user a4860405 haslo6
put /usr/backup/$NOWDATE.tar.gz $NOWDATE.tar.gz
!
EOF
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
