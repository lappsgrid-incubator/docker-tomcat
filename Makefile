DOCKER=docker
IMAGE=lappsgrid/tomcat9
VERSION=1.0.0

tomcat:
	$(DOCKER) build -t $(IMAGE) .

push:
	$(DOCKER) push $(IMAGE)

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

