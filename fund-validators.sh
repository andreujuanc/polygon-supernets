privateKey=$1

NATIVE_TOKEN_ADDRESS=$(sudo jq .rootchain.rootNativeERC20Address -r ./chain/manifest.json)

# docker run  --rm -it -v $PWD/chain:/chain 0xpolygon/polygon-edge:stable rootchain fund --help \
#     --json-rpc https://matic-mumbai.chainstacklabs.com \
#     --data-dir  /chain/data \
#     --privateKey $privateKey \
#     --native-root-token $NATIVE_TOKEN_ADDRESS


# Flags:
#       --amounts strings         amounts to send to receiving accounts
#   -h, --help                    help for deposit-erc20
#       --json-rpc string         the JSON RPC root chain endpoint (default "http://127.0.0.1:8545")
#       --receivers strings       receiving accounts addresses on child chain
#       --root-predicate string   root ERC20 token predicate address
#       --root-token string       root ERC20 token address
#       --sender-key string       hex encoded private key of the account which sends rootchain deposit transactions
#       --test                    test indicates whether depositor is hardcoded test account (in that case tokens are minted to it, so it is able to make deposits)
