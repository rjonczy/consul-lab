#!/bin/bash

# ./start.sh 10.0.0.5 10.0.0.4:8204

# ----------------------------------------------------
BIND=${1:-"127.0.0.1"}
RESULTS_DIR="/tmp"
DATADIR=$(mktemp -d ${RESULTS_DIR}/consul.XXXXXXXXXX)
CONFIG_FILE="config.json"
DC="dc-1"
LOG_LEVEL="DEBUG"
WAN_ADDR=${2:-"127.0.0.1:8204"}
# ----------------------------------------------------


# copy config to tmp datadir
cp ${CONFIG_FILE} ${DATADIR}/${CONFIG_FILE}

# start agent
consul agent \
  -dev \
  -datacenter "${DC}" \
  -bind "${BIND}" \
  -retry-join-wan "${WAN_ADDR}" \
  -config-file "${DATADIR}/${CONFIG_FILE}" \
  -data-dir "${DATADIR}" \
  -log-level "${LOG_LEVEL}"