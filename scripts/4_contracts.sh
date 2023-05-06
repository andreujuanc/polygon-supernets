adminKey=$1

docker run \
    --rm -it \
    -v $PWD/chain:/chain \
    0xpolygon/polygon-edge:stable \
    rootchain init-contracts \
    --manifest /chain/manifest.json \
    --json-rpc https://matic-mumbai.chainstacklabs.com \
    --deployer-key $adminKey
    # --rootchain-erc20 