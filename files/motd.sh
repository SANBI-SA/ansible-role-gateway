#!/usr/bin/env bash

### Settings ###
TMP_FILENAME=/run/sysinfo.txt

#/etc/update-motd.d/parts/sysinfo

################

/etc/update-motd.d/parts/sysinfo.sh >$TMP_FILENAME

### Output ###
echo
pr -mtJ /etc/update-motd.d/sanbi.txt $TMP_FILENAME

##############

### Cleanup ###
rm $TMP_FILENAME

##############