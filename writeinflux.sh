#!/bin/bash

INF_HOST="<your-influx-host-including-port>"
INF_API_KEY="<your-influx-api-token>"
INF_AUTH="Authorization: Token $INF_API_KEY"
HOST=`hostname`
TS=`date +%s%N`
GEN=$(docker compose -f /root/db1000n/examples/docker/static-docker-compose.yml logs | grep "Generated.*|" | cut -d'|' -f3 | sed 's/[^0-9]//g' | tail -n 1)
REC=$(docker compose -f /root/db1000n/examples/docker/static-docker-compose.yml logs | grep "Received.*|" | cut -d'|' -f3 | sed 's/[^0-9]//g' | tail -n 1)
RATE=$(docker compose -f /root/db1000n/examples/docker/static-docker-compose.yml logs | grep "Response rate.*" | cut -d'|' -f2 | sed 's/[^0-9.]//g' | tail -n 1)

function send() {
curl -i -XPOST \
	"http://$INF_HOST/api/v2/write?bucket=db1000n&precision=ns&org=4e5e0aac5e34d426" \
	--header "$INF_AUTH" \
	--data-raw "$1,host=$HOST value=$2 $TS"
}

send generated_bytes $GEN
send received_bytes $REC
send response_rate $RATE
