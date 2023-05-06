chainId=$1

# TODO: --validators "/ip4/10.1.1.11/tcp/30301/p2p/$(polygon-edge polybft-secrets --insecure --output --data-dir data1 --json | jq -r .[0].node_id)":$(polygon-edge polybft-secrets --insecure --output --data-dir data1 --json | jq -r .[0].address):$(polygon-edge polybft-secrets --insecure --output --data-dir data1 --json | jq -r .[0].bls_pubkey):$(polygon-edge polybft-secrets --insecure --output --data-dir data1 --json | jq -r .[0].bls_signature)

docker run \
    --rm -it \
    -v $PWD/chain:/chain \
    0xpolygon/polygon-edge:stable \
    manifest \
    --chain-id $chainId \
    --validators-path /chain \
    --validators-prefix data- \
    --path /chain/manifest.json \
    --premine-validators 100
