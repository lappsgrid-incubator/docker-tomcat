DOCKER=docker
IMAGE=lappsgrid/tomcat7
VERSION=1.2.0

tomcat:
	$(DOCKER) build -t $(IMAGE) .
	
push:
	$(DOCKER) push $(IMAGE):latest

tag:
	docker tag $(IMAGE) $(IMAGE):$(VERSION)
	docker push $(IMAGE):$(VERSION)

help:
	@echo "GOALS"
	@echo
	@echo "tomcat  - A bare Tomcat 7 server. (Default goal)"
	@echo "push    - Pushes the $(IMAGE):latest image to the Docker hub."
	@echo "tag     - Tags the $(IMAGE):$(VERSION) image and pushes it to the Docker hub."
	@echo "help    - Prints this message."
	@echo

