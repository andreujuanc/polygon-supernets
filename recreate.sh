address=$1
adminKey=$2

chainId=85000
premine="$address:1000000000000000000000"

sudo rm -rf ./chain
./scripts/0_docker.sh
./scripts/1_init.sh $chainId
./scripts/3_manifest.sh $chainId
./scripts/4_contracts.sh $adminKey
./scripts/5_genesis.sh $chainId $premine
