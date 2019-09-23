#!/bin/bash
set -e
# Cleanup any existing local docker images, volumes & containers
echo "Removing existing containers"
docker stop $(docker ps -q) || true
docker rm $(docker ps -aq) || true
#docker rmi $(docker images -q) -f

#remove all exiting depended folders
rm -rf $HOME/go/src/github.com/hyperledger
export path to go folder
export GOPATH=$HOME/go
GOROOT=$GOPATH/src/github.com/hyperledger/
DIR_FABRIC="fabric"
DIR_APP="odpid"
DIR_CHAINCODE_EVM="evm_chaincode_burrow"
DIR_BASIC_CHAINCODE="fabric-chaincode-evm"
DIR_ODPID_SERVICE="odpid_contract"
DIR_URN_SERVICE="urn_service"
DIR_FABRIC_API_SERVICE="fabric_service_api"
DIR_FABRIC_ADMIN_SERVICE="fabric_admin_api"

if [ -d $GOROOT ]; then
  echo "$GOROOT directory exists"
else
  #create new folder
  sudo mkdir -p $GOROOT
  chmod +x $GOROOT
fi

cd $GOROOT
echo "$GOROOT"

if [ ! -d "$DIR_FABRIC" ]; then
  git clone https://hsi:A_pX_8nMjg1Lr3zKELYD@gitlab.fokus.fraunhofer.de/blockchain-odpid/fabric.git 
fi

if [ ! -d "$DIR_ODPID_SERVICE" ]; then
  git clone https://hsi:A_pX_8nMjg1Lr3zKELYD@gitlab.fokus.fraunhofer.de/blockchain-odpid/odpid_contract.git 
fi
echo "odpid contract service exist"

if [ ! -d "$DIR_URN_SERVICE" ]; then
  git clone https://hsi:A_pX_8nMjg1Lr3zKELYD@gitlab.fokus.fraunhofer.de/blockchain-odpid/urn_service.git 
fi
echo "urn service exist"

if [ ! -d "$DIR_FABRIC_ADMIN_SERVICE" ]; then
  git clone https://hsi:A_pX_8nMjg1Lr3zKELYD@gitlab.fokus.fraunhofer.de/blockchain-odpid/fabric_admin_api.git 
fi
echo "fabric admin service exist"


if [ ! -d "$DIR_FABRIC_API_SERVICE" ]; then
  git clone https://hsi:A_pX_8nMjg1Lr3zKELYD@gitlab.fokus.fraunhofer.de/blockchain-odpid/fabric_api.git 
fi
echo "fabric api exists"

if [ ! -d "$DIR_FABRIC_ADMIN_SERVICE" ]; then
  git clone https://hsi:A_pX_8nMjg1Lr3zKELYD@gitlab.fokus.fraunhofer.de/blockchain-odpid/DIR_FABRIC_ADMIN_SERVICE.git 
fi
echo "fabric admin api exists"

chmod 777 fabric
cd fabric

# install/run the latest docker images for Hyperledger Fabric
./bootstrap.sh

cd $GOROOT
if [ ! -d "$DIR_CHAINCODE_EVM" ]; then
  # clone fabric chaincode evm
  git clone https://hsi:A_pX_8nMjg1Lr3zKELYD@gitlab.fokus.fraunhofer.de/blockchain-odpid/fabric-chaincode-evm.git
fi
chmod 777 fabric-chaincode-evm
cd fabric-chaincode-evm
cd ..

cd $GOROOT/fabric/odpid-basic-network

export PATH=$PATH:$PWD/bin
# fabric network execution
mkdir channel-artifacts
./odpid.sh down
./odpid.sh generate
./odpid.sh up -a

set +e




