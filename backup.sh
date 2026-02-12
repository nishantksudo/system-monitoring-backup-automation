#!/bin/bash

SOURCE="/home/$USER/testdata"
DEST="./backups"
DATE=$(date +%F)

mkdir -p $DEST

tar -czf $DEST/backup-$DATE.tar.gz $SOURCE

echo "Backup completed on $DATE"
