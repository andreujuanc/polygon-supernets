chainId=$1
premine=$2

NODE_1=$(docker run --rm -it -v $PWD/chain:/chain 0xpolygon/polygon-edge:stable polybft-secrets --insecure --output --data-dir /chain/data-1 --json | jq -r .[0].node_id)
NODE_2=$(docker run --rm -it -v $PWD/chain:/chain 0xpolygon/polygon-edge:stable polybft-secrets --insecure --output --data-dir /chain/data-2 --json | jq -r .[0].node_id)

docker run --rm -it -v $PWD/chain:/chain 0xpolygon/polygon-edge:stable \
    genesis \
    --block-gas-limit 10000000 \
    --epoch-size 10 \
    --chain-id $chainId \
    --mintable-native-token \
    --consensus polybft \
    --premine $premine \
    --manifest /chain/manifest.json \
    --dir /chain/genesis.json \
    --bootnode /dns4/node-1/tcp/30001/p2p/$NODE_1 \
    --bootnode /dns4/node-2/tcp/30001/p2p/$NODE_2 
    #--bridge-json-rpc http://127.0.0.1:8545 \
    # --reward-wallet 0x0000000000000000000000000000000000000000