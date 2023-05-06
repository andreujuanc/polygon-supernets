docker run --rm -it -v $PWD/chain:/chain 0xpolygon/polygon-edge:stable  secrets output  --validator --data-dir /chain/data-1
docker run --rm -it -v $PWD/chain:/chain 0xpolygon/polygon-edge:stable  secrets output  --validator --data-dir /chain/data-2
docker run --rm -it -v $PWD/chain:/chain 0xpolygon/polygon-edge:stable  secrets output  --validator --data-dir /chain/data-3
docker run --rm -it -v $PWD/chain:/chain 0xpolygon/polygon-edge:stable  secrets output  --validator --data-dir /chain/data-4