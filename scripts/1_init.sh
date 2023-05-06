chainId=$1

docker run --rm -it -v $PWD/chain:/chain 0xpolygon/polygon-edge:stable \
    polybft-secrets \
    --chain-id $chainId \
    --insecure \
    --data-dir /chain/data- \
    --num 4