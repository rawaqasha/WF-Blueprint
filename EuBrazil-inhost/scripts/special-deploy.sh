set -e
blueprint=$1
block=$(ctx node name)
CONTAINER_ID=$2
BLOCK_NAME=$(ctx node properties block_name)
BLOCK_URL=$3
LIB_DIR=$4

sudo docker exec -it ${CONTAINER_ID} [ ! -d ${blueprint} ] && sudo docker exec -it ${CONTAINER_ID} mkdir ${blueprint}

sudo docker exec -it ${CONTAINER_ID} [ ! -f ${blueprint}/${BLOCK_NAME} ] && sudo docker exec -it ${CONTAINER_ID} wget -O ${blueprint}/${BLOCK_NAME} ${BLOCK_URL}

ctx logger info "Execute the block"
if [ $block = "Mega-NJ" ]; then
   sudo docker exec -it ${CONTAINER_ID} jar xf ${blueprint}/${BLOCK_NAME} M6CC.mao
fi   
sudo docker exec -it ${CONTAINER_ID} java -jar ${blueprint}/${BLOCK_NAME} ${blueprint} ${block} ${LIB_DIR}


