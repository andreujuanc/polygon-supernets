#!/bin/bash
nodeId=$1

echo Starting node: $nodeId
ls /chain/data
polygon-edge server \
    --data-dir /chain/data \
    --chain /chain/genesis.json \
    --grpc-address 0.0.0.0:5001 \
    --libp2p 0.0.0.0:30001 \
    --jsonrpc 0.0.0.0:5002 \
    --seal \
    --log-level DEBUG
