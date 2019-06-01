#!/bin/bash

#used to add device to CM's lunch
for flavor in eng userdebug user; do
    add_lunch_combo "cm_m3s-${flavor}"
done
