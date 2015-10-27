#!/bin/bash
##################################################
# Name: check-yum-updates.sh
# Description: Checks for updates, sends an email when there is.
# Script Maintainer: Jacob Amey
#
# Last Updated: July 9th 2013
##################################################
# Set Variables
#
EMAIL="galan.costin@gmail.com"
YUMTMP="/tmp/yum-check-update.$$"
YUM="/usr/bin/yum"
$YUM check-update >& $YUMTMP
YUMSTATUS="$?"
HOSTNAME=$(/bin/hostname)
#
##################################################
# Main Script
#
case $YUMSTATUS in
0)
# no updates!
exit 0
;;
*)
DATE=$(date)
NUMBERS=$(egrep '(.i386|.x86_64|.noarch|.src)' < $YUMTMP | wc -l)
UPDATES=$(egrep '(.i386|.x86_64|.noarch|.src)' < $YUMTMP)

echo "
There are $NUMBERS updates available on host $HOSTNAME at $DATE

The available updates are:
$UPDATES 
" | /bin/mailx -s "UPDATE: $NUMBERS updates available for $HOSTNAME" $EMAIL
;;
esac
##################################################
# clean up
#
rm -f /tmp/yum-check-update.*
# EOF
