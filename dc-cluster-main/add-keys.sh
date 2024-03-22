#!/bin/bash

# ./add-keys.sh 10.0.0.5:8300

CONSUL_RPC_ADDR=${1:-"127.0.0.1:8500"}
CONSUL_URL="http://${CONSUL_RPC_ADDR}/v1/kv"
KEY_PREFIX="global/"

COUNTER=1

while true; do
  ((COUNTER++))
  
  KEY_NAME="${KEY_PREFIX}${COUNTER}"
  KEY_VALUE="This is value ${COUNTER}"
  docker exec -it consul-server-0 curl -L -X PUT -d "${KEY_VALUE}" "${CONSUL_URL}/${KEY_NAME}"

  echo "Added key ${KEY_NAME} with value: ${KEY_VALUE}"

  sleep 5
done
