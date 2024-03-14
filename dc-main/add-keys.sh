#!/bin/bash

CONSUL_URL="http://localhost:8200/v1/kv"
KEY_PREFIX="global/"

COUNTER=1

while true; do
  ((COUNTER++))
  
  KEY_NAME="${KEY_PREFIX}${COUNTER}"
  KEY_VALUE="This is value ${COUNTER}"
  curl -X PUT -d "${KEY_VALUE}" "${CONSUL_URL}/${KEY_NAME}"

  echo "Added key ${KEY_NAME} with value: ${KEY_VALUE}"

  sleep 5
done
