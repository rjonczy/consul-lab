#!/bin/bash

PORT=$1

CONSUL_URL="http://10.0.0.4:${PORT}/v1/kv"
KEY_PREFIX="global/"

COUNTER=1

while true; do
  ((COUNTER++))
  
  KEY_NAME="${KEY_PREFIX}${COUNTER}"
  KEY_VALUE="This is value ${COUNTER}"
  curl -L -X PUT -d "${KEY_VALUE}" "${CONSUL_URL}/${KEY_NAME}"

  echo "Added key ${KEY_NAME} with value: ${KEY_VALUE}"

  sleep 5
done
