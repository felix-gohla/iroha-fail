# Tests with Hyperledger Iroha
Hyperledger Iroha Tests but the chain does not start properly.

## Steps to reproduce.

1. Build Iroha from the official repository or use the provided .deb files ([here](docker/iroha-1.1.2-Linux.deb))
2. `docker-compose up`
3. Iroha gets stuck after some messages

## Background

I am trying to benchmark the blockchain with Caliper, over a simulated network testbed ([Cohydra](https://github.com/osmhpi/cohydra)). The simulated delay (ping time) is around 5-10ms. The testbed starts the peers sequentially. This is imitated by the sleeps in the [docker-compose file](docker-compose.yaml).