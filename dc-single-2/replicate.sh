#!/bin/bash

# ./replicate.sh 10.0.0.5:8500

# ----------------------------------------------------
LOG_LEVEL="DEBUG"
CONSUL_ADDR=${1:-"127.0.0.1:8500"}
# ----------------------------------------------------

consul-replicate \
  -consul-addr ${CONSUL_ADDR} \
  -prefix "global@main-dc:backup" \
  -log-level "${LOG_LEVEL}"
