#!/bin/bash
# export path to go folder
export GOPATH=$HOME/go
GOROOT=$GOPATH/src/github.com/hyperledger/
DIR_ODPID_SERVICE="odpid_contract"
echo "folder permission"
chmod 777 $GOROOT/odpid_contract

cd $GOROOT/odpid_contract
# install dependencies and start the service with ENV
npm install & npm install -g truffle & truffle complile & PORT=3000 RPC_HOST=localhost RPC_PORT=5001 RPC_PROTOCOL=http npm start 
