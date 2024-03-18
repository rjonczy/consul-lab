#!/bin/bash
echo "members"
docker exec -it consul-server-2 consul members

echo "members -wan"
docker exec -it consul-server-2 consul members -wan