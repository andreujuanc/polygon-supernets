chainId=$1
premine=$2

NODE_1=$(docker run --rm -it -v $PWD/chain:/chain 0xpolygon/polygon-edge:stable polybft-secrets --insecure --output --data-dir /chain/data-1 --json | jq -r .[0].node_id)
NODE_2=$(docker run --rm -it -v $PWD/chain:/chain 0xpolygon/polygon-edge:stable polybft-secrets --insecure --output --data-dir /chain/data-2 --json | jq -r .[0].node_id)

STATE_SENDER_ADDRESS=$(sudo jq .rootchain.stateSenderAddress -r ./chain/manifest.json)
echo got state sender: $STATE_SENDER_ADDRESS

docker run --rm -it -v $PWD/chain:/chain 0xpolygon/polygon-edge:stable \
    genesis \
    --block-gas-limit 10000000 \
    --epoch-size 30 \
    --chain-id $chainId \
    --mintable-native-token \
    --consensus polybft \
    --premine $premine \
    --manifest /chain/manifest.json \
    --dir /chain/genesis.json \
    --bootnode /dns4/node-1/tcp/30001/p2p/$NODE_1 \
    --bootnode /dns4/node-2/tcp/30001/p2p/$NODE_2 \
    --bridge-json-rpc https://matic-mumbai.chainstacklabs.com \
    --name eldorado-chain \
    --tracker-start-blocks $STATE_SENDER_ADDRESS:1 \
    --block-time "10s"
    #--bridge-json-rpc http://127.0.0.1:8545 \
    # --reward-wallet 0x0000000000000000000000000000000000000000

echo "Predicate Address $(sudo jq .rootchain.rootERC20PredicateAddress -r ./chain/manifest.json)"

#       --block-gas-limit uint                               the maximum amount of gas used by all transactions in a block (default 5242880)
#       --block-time duration                                the predefined period which determines block creation frequency (default 2s)
#       --bootnode stringArray                               multiAddr URL for p2p discovery bootstrap. This flag can be used multiple times
#       --bridge-json-rpc string                             the rootchain JSON RPC endpoint
#       --chain-id uint                                      the ID of the chain (default 100)
#       --consensus string                                   the consensus protocol to be used (default "polybft")
#       --contract-deployer-allow-list-admin stringArray     list of addresses to use as admin accounts in the contract deployer allow list
#       --contract-deployer-allow-list-enabled stringArray   list of addresses to enable by default in the contract deployer allow list
#       --dir string                                         the directory for the Polygon Edge genesis data (default "./genesis.json")
#       --epoch-reward uint                                  reward size for block sealing (default 1)
#       --epoch-size uint                                    the epoch size for the chain (default 100000)
#       --grpc-address string                                the GRPC interface (default "127.0.0.1:9632")
#   -h, --help                                               help for genesis
#       --ibft-validator stringArray                         addresses to be used as IBFT validators, can be used multiple times. Needs to be present if ibft-validators-prefix-path is omitted
#       --ibft-validator-type string                         the type of validators in IBFT (default "bls")
#       --ibft-validators-prefix-path string                 prefix path for validator folder directory. Needs to be present if ibft-validator is omitted
#       --manifest string                                    the manifest file path, which contains genesis metadata (default "./manifest.json")
#       --max-validator-count uint                           the maximum number of validators in the validator set for PoS (default 9007199254740990)
#       --min-validator-count uint                           the minimum number of validators in the validator set for PoS (default 1)
#       --mintable-native-token                              flag indicate whether mintable or non-mintable native ERC20 token is deployed
#       --name string                                        the name for the chain (default "polygon-edge")
#       --pos                                                the flag indicating that the client should use Proof of Stake IBFT. Defaults to Proof of Authority if flag is not provided or false
#       --premine stringArray                                the premined accounts and balances (format: <address>:<balance>). Default premined balance: 1000000000000000000000000
#       --sprint-size uint                                   the number of block included into a sprint (default 5)
#       --tracker-start-blocks stringArray                   event tracker starting block configuration, which is specified per contract address (format: <contract address>:<start block>)
#       --trieroot string                                    trie root from the corresponding triedb
#       --validator-set-size int                             the total number of validators (default 100)