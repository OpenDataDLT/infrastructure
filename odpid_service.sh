#!/bin/bash
# start odpid service
sh ./odpid_contract_service.sh 
# start urn service
& sh ./urn_service.sh

# need to configure Fabric API service, Fabric Admin service and hyperledger Explorer here
