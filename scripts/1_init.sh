chainId=$1

docker run --rm -it -v $PWD/chain:/chain 0xpolygon/polygon-edge:stable \
    polybft-secrets \
    --insecure \
    --data-dir /chain/data- \
    --num 4

# Flags:
#       --account           the flag indicating whether new account is created (default true)
#       --config string     the path to the SecretsManager config file, if omitted, the local FS secrets manager is used
#       --data-dir string   the directory for the Polygon Edge data if the local FS is used
#   -h, --help              help for polybft-secrets
#       --insecure          the flag indicating should the secrets stored on the local storage be encrypted
#       --network           the flag indicating whether new Network key is created (default true)
#       --num int           the flag indicating how many secrets should be created, only for the local FS (default 1)
#       --output            the flag indicating to output existing secrets
#       --private           the flag indicating whether Private key is printed