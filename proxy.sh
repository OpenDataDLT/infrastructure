#!/bin/bash
set -e

GOROOT=$HOME/go/src/github.com/hyperledger

export FABPROXY_CONFIG=$GOROOT/fabric-chaincode-evm/odpid_fab3/network-config.yaml
export FABPROXY_USER=User1
export FABPROXY_ORG=Org1
export FABPROXY_CHANNEL=mychannel
export FABPROXY_CCID=evmcc
export PORT=5001


# build & start
cd $GOROOT/fabric-chaincode-evm
./fab3
