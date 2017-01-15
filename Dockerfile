FROM lappsgrid/ubuntu:16.04

USER root

ENV TERM=xterm

RUN apt-get update && apt-get install -y tomcat7 tomcat7-admin tomcat7-user tomcat7-common tomcat7-docs
COPY ./tomcat-users.xml /etc/tomcat7/tomcat-users.xml
COPY ./setenv.sh /usr/share/tomcat7/bin/setenv.sh
COPY ./startup.sh /usr/bin/startup
COPY ./shutdown.sh /usr/bin/shutdown
COPY ./tail-log.sh /usr/bin/taillog
COPY ./waitforlog.sh /usr/bin/waitforlog
COPY ./waitforstart.sh /usr/bin/waitforstart

#RUN chmod ug+x /usr/bin/waitforstart 
#RUN chmod ug+x /usr/bin/taillog && \
#	chmod ug+x /usr/bin/shutdown && \
#	chmod ug+x /usr/bin/waitforlog 
RUN cd /usr/bin && chmod ug+x startup shutdown waitforstart waitforlog taillog
	
CMD ["/usr/bin/startup"]


