#!/bin/bash

set -e
blueprint=$1
file=$(ctx node properties source)
CONTAINER_ID=$2
sourcefile=${HOME}/input/${file}

sudo docker exec -it ${CONTAINER_ID} [ ! -d ${blueprint} ] && sudo docker exec -it ${CONTAINER_ID} mkdir ${blueprint}


ctx logger info "copy the input"

filename=$(basename "$sourcefile")
cat ${sourcefile} | sudo docker exec -i ${CONTAINER_ID} sh -c 'cat > /root/'${blueprint}/${filename}


