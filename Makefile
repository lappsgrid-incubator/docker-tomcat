DOCKER=/usr/local/bin/docker

help:
	@echo "GOALS"
	@echo
	@echo "tomcat   - A bare Tomcat 7 server."
	@echo "gigaword - Adds the Gigaword datasource to Tomcat"
	@echo "getwar   - Copies the Gigaword war file from my workspace"
	@echo
	
tomcat:
	$(DOCKER) build -f Dockerfile.tomcat -t lappsgrid/tomcat7 .
	
gigaword:
	$(DOCKER) build -f Dockerfile.gigaword -t lappsgrid/gigaword .
	
getwar:
	cp /Users/suderman/Workspaces/IntelliJ/Services/org.anc.lapps.gigaword/target/GigawordDataSource.war .

push-tomcat:
	$(DOCKER) push lappsgrid/tomcat7

push-gigaword:
	$(DOCKER) push lappsgrid/gigaword

