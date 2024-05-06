IMAGE_NAME := default-image
TAG := ubuntu-20-04-rc-01
DOCKER_USERNAME ?= $(echo $DOCKER_USERNAME)
DOCKER_PASSWORD ?= $(echo $DOCKER_PASSWORD)

.PHONY: build push login

build:
	docker build -t $(DOCKER_USERNAME)/$(IMAGE_NAME):$(TAG) .

login:
	@docker login -u $(DOCKER_USERNAME) -p $(DOCKER_PASSWORD)

push: login
	docker push $(DOCKER_USERNAME)/$(IMAGE_NAME):$(TAG)