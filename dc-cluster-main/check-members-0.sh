#!/bin/bash
echo "members"
docker exec -it consul-server-0 consul members

echo "members -wan"
docker exec -it consul-server-0 consul members -wan