#!/bin/bash
#
CONSUL_JOIN=$(ip r g 8.8.8.8 | awk '{ gsub(/\n$/,""); printf("%s", $3); }')
DATACENTRE=${DATACENTRE:-"default"}
ENCRYPT=${ENCRYPT:-"Ka33LTg+OADO9G1W2+4REQ=="}
exec /usr/local/bin/consul agent -data-dir /consul-data -config-dir /etc/consul.d -join $CONSUL_JOIN -dc $DATACENTRE -client 0.0.0.0 -encrypt ${ENCRYPT} &
exec /usr/local/bin/droned --config=/etc/drone/drone.toml
#exec ${CATALINA_HOME}/bin/catalina.sh run


