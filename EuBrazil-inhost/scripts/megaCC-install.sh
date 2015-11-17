#!/bin/bash

set -e

CONTAINER_NAME=$1
Lib_URL=$2
Lib_Path=$(ctx node properties lib_path)

        set +e
	  git=$(sudo docker exec -it ${CONTAINER_NAME} which git)
        set -e
	if [[ -z ${git} ]]; then
         	sudo docker exec -it ${CONTAINER_NAME} apt-get update
  	        sudo docker exec -it ${CONTAINER_NAME} apt-get -y install git
        fi

sudo docker exec -it ${CONTAINER_NAME} [ ! -d ${Lib_Path} ] &&sudo docker exec -it ${CONTAINER_NAME} git clone ${Lib_URL}

