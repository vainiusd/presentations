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

echo "Deleting the bridge"
sudo ip link delete $BRIDGE_NAME

echo "Deleting NS route to other node"
sudo ip route del $TO_BRIDGE_SUBNET via $TO_NODE_IP dev ens160

echo "Deleting virtual services"
sudo ipvsadm -D -t $VIP:80

echo "Killing the webservers"
sudo killall python3

echo "FINNISED DEMO-4 CLEANUP"
