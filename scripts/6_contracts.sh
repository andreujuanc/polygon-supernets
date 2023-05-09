adminKey=$1
rootchainToken=$2

docker run \
    --rm -it \
    -v $PWD/chain:/chain \
    0xpolygon/polygon-edge:stable \
    rootchain deploy \
    --deployer-key $adminKey \
    --erc20-token $rootchainToken \
    --genesis /chain/genesis.json \
    --json-rpc https://matic-mumbai.chainstacklabs.com


    
# Flags:
#       --deployer-key string    hex-encoded private key of the account which deploys rootchain contracts
#       --erc1155-token string   existing root chain ERC 1155 token address
#       --erc20-token string     existing root chain ERC 20 token address
#       --erc721-token string    existing root chain ERC 721 token address
#       --genesis string         genesis file path, which contains chain configuration (default "./genesis.json")
#   -h, --help                   help for deploy
#       --json-rpc string        the JSON RPC rootchain IP address (default "http://127.0.0.1:8545")
#       --test                   test indicates whether rootchain contracts deployer is hardcoded test account (otherwise provided secrets are used to resolve deployer account)
