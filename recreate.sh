address=$1

chainId=85000
premine="$address:1000000000000000000000"

sudo rm -rf ./chain
./scripts/0_docker.sh
./scripts/1_init.sh $chainId
./scripts/3_manifest.sh $chainId
./scripts/4_genesis.sh $chainId $premine
