#!/bin/bash

npm install -g lodash --unsafe
caliper bind --caliper-bind-sut iroha --caliper-bind-sdk latest --caliper-bind-args=-g

# caliper benchmark run --caliper-benchconfig benchmarking/railchain_logging.yaml --caliper-networkconfig blockchains/iroha/iroha.json