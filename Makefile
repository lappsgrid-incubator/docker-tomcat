DOCKER=docker
IMAGE=lappsgrid/tomcat7
VERSION=1.2.3

tomcat:
	cat tomcat-users.xml.template | sed "s/__PASSWORD__/$(shell curl http://api.lappsgrid.org/password)/" > tomcat-users.xml
	$(DOCKER) build -t $(IMAGE):$(VERSION) .
	rm tomcat-users.xml

push:
	$(DOCKER) push $(IMAGE):latest

push-version:
	docker push $(IMAGE):$(VERSION)
	
tag:
	docker tag $(IMAGE) $(IMAGE):$(VERSION)
	docker push $(IMAGE):$(VERSION)

help:
	@echo "GOALS"
	@echo
	@echo "tomcat       - A bare Tomcat 7 server. (Default goal)"
	@echo "push         - Pushes the $(IMAGE):latest image to the Docker hub."
	@echo "push-version - Pushes $(IMAVE):$(VERSION) to the Docker hub"
	@echo "tag          - Tags the $(IMAGE):$(VERSION) image and pushes it to the Docker hub."
	@echo "help         - Prints this message."
	@echo

