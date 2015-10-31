DOCKER=/usr/local/bin/docker
IMAGE=lappsgrid/tomcat7

tomcat:
	$(DOCKER) build -t $(IMAGE) .
	
push:
	$(DOCKER) push $(IMAGE)

tag:
	if [ -n "$(TAG)" ] ; then $(DOCKER) tag $(IMAGE) $(IMAGE):$(TAG)

help:
	@echo "GOALS"
	@echo
	@echo "tomcat - A bare Tomcat 7 server."
	@echo "push   - Pushes the $(IMAGE) to the Docker hub."
	@echo "tag    - Tags $(IMAGE) on the the Docker hub. The"
	@echo "         tag name must be specified as a parameter."
	@echo "         I.E.> make tag TAG=foobar"
	@echo

