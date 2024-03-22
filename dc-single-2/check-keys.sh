#!/bin/bash
docker exec -it dc-single-1-consul-1 consul kv get -keys -http-addr http://localhost:8500