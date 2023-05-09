adminKey=$1
rootchainToken=$2

docker run \
    --rm -it \
    -v $PWD/chain:/chain \
    0xpolygon/polygon-edge:stable \
    rootchain init-contracts \
    --manifest /chain/manifest.json \
    --json-rpc https://matic-mumbai.chainstacklabs.com \
    --deployer-key $adminKey \
    --rootchain-erc20 $rootchainToken 