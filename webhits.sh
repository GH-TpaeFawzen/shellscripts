#!/bin/sh
#
# webhits -- Reports amount of website hits, total values and per user hits by parsing the Apache Access log
# Author: Prasanjit 
#
########
# Declare the apache access log path by either using 
WEBLOG="/var/log/httpd/access_log"

case "$1" in ("")
 echo "Usage: `basename $0` <user1> <user2> osv.."
 exit
esac
date > wtstat
echo "`cat $WEBLOG|wc -l` total hits on `hostname` " >>wtstat
for i in $* 
do
 echo "`grep $i $WEBLOG|wc -l` hits on $i" >>wtstat
done 
sort -r wtstat -o wtstat
more wtstat
rm wtstat
