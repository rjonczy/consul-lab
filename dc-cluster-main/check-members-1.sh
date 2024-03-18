#!/bin/bash
echo "members"
docker exec -it consul-server-1 consul members

echo "members -wan"
docker exec -it consul-server-1 consul members -wan