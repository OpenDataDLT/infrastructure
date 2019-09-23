#!/bin/bash
# export path to go folder
export GOPATH=$HOME/go
GOROOT=$GOPATH/src/github.com/hyperledger/
DIR_URN_SERVICE="urn_service"

echo "folder permission"
chmod 777 $GOROOT/urn_service

cd $GOROOT/urn_service
# install dependencies and start the service with ENV
npm install & PORT=5000 ODPID_SERVICE="http://localhost:3000" URN_PROTOCOL="did" URN_TYPE="odpid" npm start 
