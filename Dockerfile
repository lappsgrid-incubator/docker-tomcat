FROM lappsgrid/ubuntu

USER root

RUN apt-get update && apt-get install -y tomcat7 tomcat7-admin tomcat7-user tomcat7-common tomcat7-docs
ADD ./tomcat-users.xml /etc/tomcat7/tomcat-users.xml
ADD ./setenv.sh /usr/share/tomcat7/bin/setenv.sh
RUN chown root:tomcat7 /etc/tomcat7/tomcat-users.xml

ENV TERM=xterm

ADD ./startup.sh /usr/bin/startup
CMD ["/usr/bin/startup"]


