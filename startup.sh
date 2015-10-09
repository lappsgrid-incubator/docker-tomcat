#!/bin/bash

LOG=/var/log/tomcat7/catalina.out
service tomcat7 start

until [ -e $LOG ] ; do
	sleep 2
done

tail -f $LOG
