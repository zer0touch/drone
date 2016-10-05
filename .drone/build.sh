#!/bin/bash
set -e  
cd '/var/cache/drone/src/gogs.service.consul/ryanharp/drone'

# [pass tests here]

#wrapdocker &  
#sleep 5

docker -H tcp://consul.service.consul:2375 build -t registry.service.consul/drone .
docker push registry.service.consul/drone
