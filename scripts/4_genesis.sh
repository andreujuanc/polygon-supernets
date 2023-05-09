chainId=$1
premine=$2
rewardWallet=$3

NODE_1=$(docker run --rm -it -v $PWD/chain:/chain 0xpolygon/polygon-edge:stable polybft-secrets --insecure --output --data-dir /chain/data-1 --json | jq -r .[0].node_id)
NODE_2=$(docker run --rm -it -v $PWD/chain:/chain 0xpolygon/polygon-edge:stable polybft-secrets --insecure --output --data-dir /chain/data-2 --json | jq -r .[0].node_id)

# STATE_SENDER_ADDRESS=$(sudo jq .rootchain.stateSenderAddress -r ./chain/manifest.json)
# echo got state sender: $STATE_SENDER_ADDRESS


docker run --rm -it -v $PWD/chain:/chain 0xpolygon/polygon-edge:stable \
    genesis \
    --block-gas-limit 10000000 \
    --epoch-size 30 \
    --chain-id $chainId \
    --mintable-native-token \
    --consensus polybft \
    --premine $premine \
    --dir /chain/genesis.json \
    --name eldorado-chain \
    --block-time "10s" \
    --reward-wallet $rewardWallet:1000000000000000000 \
    --bootnode /dns4/node-1/tcp/30001/p2p/$NODE_1 \
    --bootnode /dns4/node-2/tcp/30001/p2p/$NODE_2 \
    --validators-path /chain \
    --validators-prefix data- 

    # --bridge-json-rpc https://matic-mumbai.chainstacklabs.com \
    #--bridge-json-rpc http://127.0.0.1:8545 \
    # --reward-wallet 0x0000000000000000000000000000000000000000

# echo "Predicate Address $(sudo jq .rootchain.rootERC20PredicateAddress -r ./chain/manifest.json)"

# Flags:
#       --block-gas-limit uint                               the maximum amount of gas used by all transactions in a block (default 5242880)
#       --block-time duration                                the predefined period which determines block creation frequency (default 2s)
#       --bootnode stringArray                               multiAddr URL for p2p discovery bootstrap. This flag can be used multiple times
#       --bridge-allow-list-admin stringArray                list of addresses to use as admin accounts in the bridge allow list
#       --bridge-allow-list-enabled stringArray              list of addresses to enable by default in the bridge allow list
#       --bridge-block-list-admin stringArray                list of addresses to use as admin accounts in the bridge block list
#       --bridge-block-list-enabled stringArray              list of addresses to enable by default in the bridge block list
#       --burn-contract stringArray                          the burn contract blocks and addresses (format: <block>:<address>)
#       --chain-id uint                                      the ID of the chain (default 100)
#       --consensus string                                   the consensus protocol to be used (default "polybft")
#       --contract-deployer-allow-list-admin stringArray     list of addresses to use as admin accounts in the contract deployer allow list
#       --contract-deployer-allow-list-enabled stringArray   list of addresses to enable by default in the contract deployer allow list
#       --contract-deployer-block-list-admin stringArray     list of addresses to use as admin accounts in the contract deployer block list
#       --contract-deployer-block-list-enabled stringArray   list of addresses to enable by default in the contract deployer block list
#       --dir string                                         the directory for the Polygon Edge genesis data (default "./genesis.json")
#       --epoch-reward uint                                  reward size for block sealing (default 1)
#       --epoch-size uint                                    the epoch size for the chain (default 100000)
#       --grpc-address string                                the GRPC interface (default "127.0.0.1:9632")
#   -h, --help                                               help for genesis
#       --ibft-validator stringArray                         addresses to be used as IBFT validators, can be used multiple times. Needs to be present if ibft-validators-prefix-path is omitted
#       --ibft-validator-type string                         the type of validators in IBFT (default "bls")
#       --ibft-validators-prefix-path string                 prefix path for validator folder directory. Needs to be present if ibft-validator is omitted
#       --max-validator-count uint                           the maximum number of validators in the validator set for PoS (default 9007199254740990)
#       --min-validator-count uint                           the minimum number of validators in the validator set for PoS (default 1)
#       --mintable-native-token                              flag indicate whether mintable or non-mintable native token is deployed
#       --name string                                        the name for the chain (default "polygon-edge")
#       --native-token-config string                         configuration of native token in format <name:symbol:decimals count>
#       --pos                                                the flag indicating that the client should use Proof of Stake IBFT. Defaults to Proof of Authority if flag is not provided or false
#       --premine stringArray                                the premined accounts and balances (format: <address>[:<balance>]). Default premined balance: 1000000000000000000000000
#       --reward-token-code string                           hex encoded reward token byte code
#       --reward-wallet string                               configuration of reward wallet in format <address:amount>
#       --sprint-size uint                                   the number of block included into a sprint (default 5)
#       --stake stringArray                                  validators staked amount (format: <address>[:<amount>]). Default stake amount: 1000000000000000000000000
#       --transactions-allow-list-admin stringArray          list of addresses to use as admin accounts in the transactions allow list
#       --transactions-allow-list-enabled stringArray        list of addresses to enable by default in the transactions allow list
#       --transactions-block-list-admin stringArray          list of addresses to use as admin accounts in the transactions block list
#       --transactions-block-list-enabled stringArray        list of addresses to enable by default in the transactions block list
#       --trieroot string                                    trie root from the corresponding triedb
#       --validators stringArray                             validators defined by user (format: <P2P multi address>:<ECDSA address>:<public BLS key>)
#       --validators-path string                             root path containing polybft validators secrets (default "./")
#       --validators-prefix string                           folder prefix names for polybft validators secrets (default "test-chain-")

