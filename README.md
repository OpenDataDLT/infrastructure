## Infrastructure


### Step 1 (prerequisites)
```
Docker
Docker Compose
NodeJS 10
GIT
```

### Step 2 (clone the repository)
```
git clone git@gitlab.fokus.fraunhofer.de:blockchain-odpid/infrastructure.git
```


### step 3 (install docker images and relevant repository)

```shell
$ ./start.sh
```

### step 4 (install EVM chain code in peer)
**install EVM chanincode in peer**

(API Development is not possible for now)

```shell
docker exec -it cli bash
export CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp
export CORE_PEER_ADDRESS=peer0.org1.example.com:7051
export CORE_PEER_LOCALMSPID="Org1MSP"
export CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt
```

then install chaincode in peer

```shell
peer chaincode install -n evmcc -l golang -v 0 -p github.com/hyperledger/fabric-chaincode-evm/evmcc
```

then instantiate chaincode in peer

```shell
peer chaincode instantiate -n evmcc -v 0 -C mychannel -c '{"Args":[]}' -o orderer.example.com:7050 --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
```

then 

```shell
$ exit
```


### step 5 (Run EVM gRPC Network)
***running evm proxy***

```shell
sh proxy.sh
```

rpc gateway is listing on ***localhost:5001***

**Note: EVM chaincode can be install on any peer in which admin wants**

### step 6 Run Services (open in a new terminal)

***To Run Services***
```shell
$ sh odpid_service.sh
```

this will start **odpid_contract** service and **urn_service**.

**_Note: fabric_api_service, fabric_admin and hyperldeger explorer still need to be configure but development is done and source code exist in blockchain-odpid group_**



### System Components


![alt text](https://gitlab.fokus.fraunhofer.de/blockchain-odpid/infrastructure/raw/master/architecture.png)

### step 8 (Frontend Integration)

**As mentioned in above image only URN service will be interacting with the frontend and APIs are explain here**

```
https://gitlab.fokus.fraunhofer.de/blockchain-odpid/urn_service

URN service should listen on : 5000

ENDPOINT: localhost:5000

```

**For ODPID service API documentation can be found here**

```
https://gitlab.fokus.fraunhofer.de/blockchain-odpid/odpid_contract

ODPID service should listen on : 6000

ENDPOINT: localhost: 6000
```


**FABRIC_API**
```
https://gitlab.fokus.fraunhofer.de/blockchain-odpid/fabric_api
```


**FABRIC_ADMIN_API**
```
https://gitlab.fokus.fraunhofer.de/blockchain-odpid/fabric_admin_api
```


### Pendings:

1. Docker Compose configuration (seems not possible because burrow is creating problem with network config)
2. Fabric APIs and Fabric Admin API configure for current implementation
3. Hyperledger Explorer Setup which is used by URN Service to show UUID belongs transactionHash verfication
4. UI to manage all APIs


### Importants and Future Work:
1. System is implemented in such a way if user want to use Ethereum Blockchain Instead of Hyperledger Fabric then user need to replace gRPC network endpoint only, rest will work smooth.
2. Hyperledger Cello is a BaaS (Blockchain as a Service) tool and can be use to replace Fabric_API and Fabric_Admin_API service and Cello provide UI panel as well.
3. EVM chaincode mannual installation on peer can be replace with interactive API by using DOCKER EXEC apis.


**Har Preet Singh**

