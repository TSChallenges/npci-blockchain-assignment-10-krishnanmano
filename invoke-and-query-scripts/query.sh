export PATH=${PWD}/../fabric-samples/bin:$PATH
export FABRIC_CFG_PATH=$PWD/../fabric-samples/config/
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="Cipla"
export CORE_PEER_TLS_ROOTCERT_FILE=$PWD/../fabric-samples/test-network/organizations/peerOrganizations/Cipla.example.com/peers/peer0.Cipla.example.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=$PWD/../fabric-samples/test-network/organizations/peerOrganizations/Cipla.example.com/users/Admin@Cipla.example.com/msp
export CORE_PEER_ADDRESS=localhost:7051

echo "Query Registered Drug"
peer chaincode query -C mychannel -n drugChaincode -c '{"Args":["TrackDrug", "AZD1001"]}'