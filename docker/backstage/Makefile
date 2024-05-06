IMAGE_NAME := backstage-amd64
TAG := 0.5.8
DOCKER_USERNAME ?= $(echo $DOCKER_USERNAME)
DOCKER_PASSWORD ?= $(echo $DOCKER_PASSWORD)

.PHONY: build push login

build:
	docker build -t $(DOCKER_USERNAME)/$(IMAGE_NAME):$(TAG) .

login:
	@docker login -u $(DOCKER_USERNAME) -p $(DOCKER_PASSWORD)

push: login
	docker push $(DOCKER_USERNAME)/$(IMAGE_NAME):$(TAG)