# IMAGE_NAME := backstage-amd64
# export DOCKER_USERNAME="xxx"
# export DOCKER_PASSWORD="xxx/!"

IMAGE_NAME := backstage-arm64

TAG := 0.5.9
DOCKER_USERNAME ?= $(echo $DOCKER_USERNAME)
DOCKER_PASSWORD ?= $(echo $DOCKER_PASSWORD)

.PHONY: build push login

build:
	docker build -t $(DOCKER_USERNAME)/$(IMAGE_NAME):$(TAG) .

login:
	@docker login -u $(DOCKER_USERNAME) -p $(DOCKER_PASSWORD)

push: login
	docker push $(DOCKER_USERNAME)/$(IMAGE_NAME):$(TAG)