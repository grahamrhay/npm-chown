.PHONY: build

PROJECT_NAME := $(shell node -p "require('./service/package.json').name")

build:
	@ echo "Building the image..."
	DOCKER_BUILDKIT=1 docker build --ssh default -t ${PROJECT_NAME} .
