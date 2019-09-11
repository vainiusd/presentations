#!/bin/bash -e

. env.sh

echo "Deleting the namespaces"
ip netns list | grep $CON1
if [ $? -eq 0 ]; then
    sudo ip netns delete $CON1
fi
ip netns list | grep $CON2
if [ $? -eq 0 ]; then
    sudo ip netns delete $CON2
fi

echo "Deleting the bridge" $BRIDGE_NAME
sudo ip link delete $BRIDGE_NAME

echo "Deleting the route on the node to reach the network namespaces on the other node"
sudo ip route del $TO_BRIDGE_SUBNET via $TO_NODE_IP dev ens160

echo "FINNISHED DEMO-3 CLEANUP"
