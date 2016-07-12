DOCKER=/usr/local/bin/docker
IMAGE=lappsgrid/tomcat7
VERSION=1.0.0

tomcat:
	$(DOCKER) build -t $(IMAGE):$(VERSION) .
	
push:
	$(DOCKER) push $(IMAGE):$(VERSION)

tag:
	if [ -n "$(TAG)" ] ; then $(DOCKER) tag $(IMAGE):$(VERSION) $(IMAGE):$(TAG) ; fi

help:
	@echo "GOALS"
	@echo
	@echo "tomcat - A bare Tomcat 7 server."
	@echo "push   - Pushes the $(IMAGE):$(VERSION) to the Docker hub."
	@echo "tag    - Tags $(IMAGE):$(VERSION) on the the Docker hub. The"
	@echo "         tag name must be specified as a parameter."
	@echo "         I.E.> make tag TAG=foobar"
	@echo

