#!/bin/bash

VENDOR=meizu
DEVICE=m3s

BASE=../../../vendor/$VENDOR/$DEVICE/proprietary

echo "Pulling $DEVICE files..."
for FILE in `cat proprietary-files.txt | grep -v ^# | grep -v ^$ | cut -d '#' -f 1`; do
    DIR=`dirname $FILE`
	if [ ! -d $BASE/$DIR ]; then
        mkdir -p $BASE/$DIR
	fi
	if [ "$1" = "image" ]; then
        cp $SRCDIR/$FILE $BASE/$FILE
	else
        adb pull /system/$FILE $BASE/$FILE
	fi
done

./setup-makefiles.sh

