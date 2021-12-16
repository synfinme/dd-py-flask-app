REPO_NAME  := synfinmelab
IMAGE_NAME := dd-py-flask-app
IMAGE_TAG  := v0.1
IMAGE      := ${REPO_NAME}/${IMAGE_NAME}:${IMAGE_TAG}

_init	:
	echo "*** Use { build | push | run } target ***"

build	:
	docker build -t ${IMAGE} .

push	: build
	docker push ${IMAGE}

run	: build
	docker run \
		-e DD_ENV -e DD_SERVICE -e DD_VERSION \
		-e DD_AGENT_HOST -e DD_TRACE_AGENT_PORT \
		-it --rm "${IMAGE}"

