#!/usr/bin/env bash

DOCKER_IMAGE=pvormste/php-ci
PHP_VERSION=7.4.0
PHP_MINOR_VERSION=${PHP_VERSION%.*}

# Build
echo "Building Docker Image ..."
echo "DOCKER_IMAGE=${DOCKER_IMAGE}"
echo "PHP_VERSION=${PHP_VERSION}"
echo "PHP_MINOR_VERSION=${PHP_MINOR_VERSION}"
echo

docker build --build-arg PHP_VERSION=${PHP_VERSION} -t ${DOCKER_IMAGE}:${PHP_VERSION} $(dirname $0)
docker tag ${DOCKER_IMAGE}:${PHP_VERSION} ${DOCKER_IMAGE}:${PHP_MINOR_VERSION}

# Push
echo "Push Docker Images ..."

echo "- Pushing ${DOCKER_IMAGE}:${PHP_VERSION} ..."
docker push ${DOCKER_IMAGE}:${PHP_VERSION}

echo "- Pushing ${DOCKER_IMAGE}:${PHP_MINOR_VERSION} ..."
docker push ${DOCKER_IMAGE}:${PHP_MINOR_VERSION}