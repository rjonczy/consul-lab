# consul-lab
Consul lab

## join 2 datacenters 

### manually
```
/ # consul join -wan 10.0.0.4
Successfully joined cluster by contacting 1 nodes.
```
### automatically using retry-join-wan

https://developer.hashicorp.com/consul/docs/agent/config/config-files#retry_join_wan
https://developer.hashicorp.com/consul/docs/agent/config/cli-flags#_retry_join_wan

Important options:
- [translate_wan_addrs](https://developer.hashicorp.com/consul/docs/agent/config/config-files#translate_wan_addrs)
- [advertise-wan](https://developer.hashicorp.com/consul/docs/agent/config/cli-flags#_advertise-wan)

## Verify

- check members
```bash
# consul members -wan
Node                  Address        Status  Type    Build   Protocol  DC       Partition  Segment
63b7c673db46.dc-1     10.0.0.5:8304  alive   server  1.18.0  2         dc-1     default    <all>
cd001120bb19.dc-main  10.0.0.4:8304  alive   server  1.18.0  2         dc-main  default    <all>
```

- check consul members (specify http port of consul agent)
```
# consul members -wan -http-addr http://0.0.0.0:8500
Node                  Address        Status  Type    Build   Protocol  DC       Partition  Segment
63b7c673db46.dc-1     10.0.0.5:8304  alive   server  1.18.0  2         dc-1     default    <all>
cd001120bb19.dc-main  10.0.0.4:8304  alive   server  1.18.0  2         dc-main  default    <all>
```

- check via `/v1/catalog`
```
curl http://localhost:8500/v1/catalog/datacenters
curl http://localhost:8500/v1/catalog/nodes?dc=dc-1
curl http://localhost:8500/v1/catalog/nodes?dc=dc-main
```

## Docker images
https://hub.docker.com/r/hashicorp/consul-replicate
https://hub.docker.com/r/hashicorp/consul

## Links
- [Federation gossip wan](https://developer.hashicorp.com/consul/tutorials/networking/federation-gossip-wan)
- [Multi dc consul on k8s](https://tech.holidayextras.com/multi-dc-consul-on-kubernetes-9a6a7dcb89e3)
- [Consul ali flags](https://developer.hashicorp.com/consul/docs/agent/config/cli-flags)
- [Consul config files](https://developer.hashicorp.com/consul/docs/agent/config/config-files)
- https://developer.hashicorp.com/consul/docs/k8s/deployment-configurations/multi-cluster
- https://developer.hashicorp.com/consul/docs/k8s/deployment-configurations/multi-cluster/kubernetes
- https://developer.hashicorp.com/consul/docs/k8s/deployment-configurations/multi-cluster/vms-and-kubernetes
- https://mesh.demo.gs/federating_clusters