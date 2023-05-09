receiver=$1
senderKey=$2
token=$3

PREDICATE_ADDRESS=$(sudo jq .rootchain.rootERC20PredicateAddress -r ./chain/manifest.json)

echo "Predicate $PREDICATE_ADDRESS"
echo "Root Token $token"

docker run  --rm -it -v $PWD/chain:/chain 0xpolygon/polygon-edge:stable bridge deposit-erc20 \
    --sender-key $senderKey \
    --receivers "0xFc57EEE23539979c799d85bE8C597435e074D36D" \
    --amounts "123" \
    --root-token $token \
    --root-predicate $PREDICATE_ADDRESS \
    --json-rpc https://matic-mumbai.chainstacklabs.com


# Flags:
#       --amounts strings         amounts to send to receiving accounts
#   -h, --help                    help for deposit-erc20
#       --json-rpc string         the JSON RPC root chain endpoint (default "http://127.0.0.1:8545")
#       --receivers strings       receiving accounts addresses on child chain
#       --root-predicate string   root ERC20 token predicate address
#       --root-token string       root ERC20 token address
#       --sender-key string       hex encoded private key of the account which sends rootchain deposit transactions
#       --test                    test indicates whether depositor is hardcoded test account (in that case tokens are minted to it, so it is able to make deposits)
