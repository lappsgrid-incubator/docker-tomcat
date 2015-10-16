DOCKER=/usr/local/bin/docker

tomcat:
	$(DOCKER) build -t lappsgrid/tomcat7 .
	
push:
	$(DOCKER) push lappsgrid/tomcat7

help:
	@echo "GOALS"
	@echo
	@echo "tomcat - A bare Tomcat 7 server."
	@echo "push   - Pushed the image to the Docker hub."
	@echo

