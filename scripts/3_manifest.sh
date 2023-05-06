chainId=$1

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
