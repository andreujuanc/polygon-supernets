address=$1
adminKey=$2
rootchainToken=0x001B3B4d0F3714Ca98ba10F6042DaEbF0B1B7b6F # DAI mumbai
chainId=85000
premine="$address:1234000000000000000000"

sudo rm -rf ./chain
sudo rm -rf ./logs
sudo rm -rf ./redis-data
sudo rm -rf ./blockscout-db-data

./scripts/0_docker.sh
./scripts/1_init.sh $chainId
./scripts/4_genesis.sh $chainId $premine $address
./scripts/6_contracts.sh $adminKey $rootchainToken
# ./scripts/7_fund.sh $adminKey $rootchainToken