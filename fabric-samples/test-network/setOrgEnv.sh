#!/usr/bin/env bash
#
# SPDX-License-Identifier: Apache-2.0




# default to using Org1
ORG=${1:-Org1}

# Exit on first error, print all commands.
set -e
set -o pipefail

# Where am I?
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"

ORDERER_CA=${DIR}/test-network/organizations/ordererOrganizations/example.com/tlsca/tlsca.example.com-cert.pem
PEER0_ORG1_CA=${DIR}/test-network/organizations/peerOrganizations/Cipla.example.com/tlsca/tlsca.Cipla.example.com-cert.pem
PEER0_ORG2_CA=${DIR}/test-network/organizations/peerOrganizations/Medlife.example.com/tlsca/tlsca.Medlife.example.com-cert.pem
PEER0_ORG3_CA=${DIR}/test-network/organizations/peerOrganizations/org3.example.com/tlsca/tlsca.org3.example.com-cert.pem
PEER0_ORG4_CA=${DIR}/test-network/organizations/peerOrganizations/Apollo.example.com/tlsca/tlsca.Apollo.example.com-cert.pem
PEER0_ORG5_CA=${DIR}/test-network/organizations/peerOrganizations/CDSCO.example.com/tlsca/tlsca.CDSCO.example.com-cert.pem

if [[ ${ORG,,} == "Cipla" || ${ORG,,} == "digibank" ]]; then

   CORE_PEER_LOCALMSPID=Cipla
   CORE_PEER_MSPCONFIGPATH=${DIR}/test-network/organizations/peerOrganizations/Cipla.example.com/users/Admin@Cipla.example.com/msp
   CORE_PEER_ADDRESS=localhost:7051
   CORE_PEER_TLS_ROOTCERT_FILE=${DIR}/test-network/organizations/peerOrganizations/Cipla.example.com/tlsca/tlsca.Cipla.example.com-cert.pem

elif [[ ${ORG,,} == "Medlife" || ${ORG,,} == "magnetocorp" ]]; then

   CORE_PEER_LOCALMSPID=Medlife
   CORE_PEER_MSPCONFIGPATH=${DIR}/test-network/organizations/peerOrganizations/Medlife.example.com/users/Admin@Medlife.example.com/msp
   CORE_PEER_ADDRESS=localhost:9051
   CORE_PEER_TLS_ROOTCERT_FILE=${DIR}/test-network/organizations/peerOrganizations/Medlife.example.com/tlsca/tlsca.Medlife.example.com-cert.pem

elif [[ ${ORG,,} == "Apollo" || ${ORG,,} == "magnetocorp" ]]; then

   CORE_PEER_LOCALMSPID=Apollo
   CORE_PEER_MSPCONFIGPATH=${DIR}/test-network/organizations/peerOrganizations/Apollo.example.com/users/Admin@Apollo.example.com/msp
   CORE_PEER_ADDRESS=localhost:13051
   CORE_PEER_TLS_ROOTCERT_FILE=${DIR}/test-network/organizations/peerOrganizations/Apollo.example.com/tlsca/tlsca.Apollo.example.com-cert.pem

elif [[ ${ORG,,} == "CDSCO" || ${ORG,,} == "magnetocorp" ]]; then

   CORE_PEER_LOCALMSPID=CDSCO
   CORE_PEER_MSPCONFIGPATH=${DIR}/test-network/organizations/peerOrganizations/CDSCO.example.com/users/Admin@CDSCO.example.com/msp
   CORE_PEER_ADDRESS=localhost:15051
   CORE_PEER_TLS_ROOTCERT_FILE=${DIR}/test-network/organizations/peerOrganizations/CDSCO.example.com/tlsca/tlsca.CDSCO.example.com-cert.pem

else
   echo "Unknown \"$ORG\", please choose Org1/Digibank or Org2/Magnetocorp"
   echo "For example to get the environment variables to set upa Org2 shell environment run:  ./setOrgEnv.sh Org2"
   echo
   echo "This can be automated to set them as well with:"
   echo
   echo 'export $(./setOrgEnv.sh Org2 | xargs)'
   exit 1
fi

# output the variables that need to be set
echo "CORE_PEER_TLS_ENABLED=true"
echo "ORDERER_CA=${ORDERER_CA}"
echo "PEER0_ORG1_CA=${PEER0_ORG1_CA}"
echo "PEER0_ORG2_CA=${PEER0_ORG2_CA}"
echo "PEER0_ORG3_CA=${PEER0_ORG3_CA}"
echo "PEER0_ORG4_CA=${PEER0_ORG4_CA}"
echo "PEER0_ORG5_CA=${PEER0_ORG5_CA}"

echo "CORE_PEER_MSPCONFIGPATH=${CORE_PEER_MSPCONFIGPATH}"
echo "CORE_PEER_ADDRESS=${CORE_PEER_ADDRESS}"
echo "CORE_PEER_TLS_ROOTCERT_FILE=${CORE_PEER_TLS_ROOTCERT_FILE}"

echo "CORE_PEER_LOCALMSPID=${CORE_PEER_LOCALMSPID}"
