#!/usr/bin/env bash
set -eou pipefail

TAG=${CIRCLE_BUILD_NUM}

docker build -t demandjump/amazon-redshift-utils:latest -t demandjump/amazon-redshift-utils:${TAG} .
docker login -u ${DOCKER_USER} -p ${DOCKER_PASSWORD}
docker tag demandjump/amazon-redshift-utils:${TAG} demandjump/amazon-redshift-utils:latest
docker push demandjump/amazon-redshift-utils:${TAG}
docker push demandjump/amazon-redshift-utils:latest

