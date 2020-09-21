#!/bin/bash

####
#
# Web site ping and response time
# Inspired by entry test @ Exxxr
#
# The script should return 0 on the first line if the web site is up. 1 if the web site is down
# On the second line it should return the response time in miliseconds
#
####

## Check the website for http response code and response time, stores it it as var
RESULT=$(curl -o /dev/null -sIL -w "%{http_code}\n%{time_total}" $1)

## If it returns 200 then we can print the output (0 + response time), else we print 1 + null response time
if [[ $(echo $RESULT | awk '{print $1}') -eq 200 ]]
then
    echo 0
    echo $RESULT | awk '{print $2}'
else
    printf "1\n000\n"
fi
