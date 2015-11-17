#!/bin/bash

set -e
blueprint=$1
CONTAINER_ID=$(ctx node properties container_ID)
IMAGE_NAME=$(ctx node properties image_name)

ctx logger info "Creating ${CONTAINER_ID}"

sudo docker run -P --name ${CONTAINER_ID} -v ~/${blueprint}:/root/${blueprint} -it -d ${IMAGE_NAME} bin/bash


