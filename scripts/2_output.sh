docker run --rm -it -v $PWD/chain:/chain 0xpolygon/polygon-edge:stable \
    secrets output \
    --node-id \
    --data-dir /chain/data-1 # X is the node number