#!/bin/bash

trap 'kill $(jobs -p)' EXIT

java -jar server.jar \
     -role hub &

sleep 1

java -jar server.jar \
     -role node \
     -nodeConfig nodeConfig.json
