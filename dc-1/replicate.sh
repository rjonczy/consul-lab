#!/bin/bash

# ./replicate.sh 10.0.0.5:8300

# ----------------------------------------------------
LOG_LEVEL="DEBUG"
CONSUL_ADDR=${1:-"127.0.0.1:8300"}
# ----------------------------------------------------

consul-replicate \
  -consul-addr ${CONSUL_ADDR} \
  -prefix "global@dc-main:backup" \
  -exclude "global/5" \
  -log-level "${LOG_LEVEL}"
