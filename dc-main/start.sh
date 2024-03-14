#!/bin/bash

# ./start.sh 10.0.0.4

# ----------------------------------------------------
BIND=${1:-"127.0.0.1"}
RESULTS_DIR="~/consuldata"
DATADIR=$(mktemp -d ${RESULTS_DIR}/consul.XXXXXXXXXX)
CONFIG_FILE="config.json"
DC="dc-main"
LOG_LEVEL="DEBUG"
# ----------------------------------------------------

# copy config to tmp datadir
cp ${CONFIG_FILE} ${DATADIR}/${CONFIG_FILE}

# start agent
consul agent \
  -dev \
  -datacenter "${DC}" \
  -bind "${BIND}" \
  -config-file "${DATADIR}/${CONFIG_FILE}" \
  -data-dir "${DATADIR}" \
  -log-level "${LOG_LEVEL}"