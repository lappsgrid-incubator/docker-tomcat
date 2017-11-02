#!/usr/bin/env bash

TOMCAT=/usr/local/tomcat
CONF=$TOMCAT/conf
BIN=$TOMCAT/bin

pw=`cat /dev/urandom | tr -dc _A-Z-a-z-0-9 | head -c${1:-16};echo;`
cat $CONF/tomcat-users-template.xml | sed "s/__PASSWORD__/$pw/" > $CONF/tomcat-users.xml

cd $BIN
catalina.sh run
