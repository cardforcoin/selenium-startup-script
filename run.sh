#!/bin/bash

trap 'kill $(jobs -p)' EXIT

java -jar server.jar \
     -role hub &

sleep 1

PATH="$PWD:$PATH" \
java -jar server.jar \
     -role node \
     -nodeConfig nodeConfig.json
