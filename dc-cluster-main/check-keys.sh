#!/bin/bash
docker exec -it consul-server-0 consul kv get -keys -http-addr http://localhost:8500