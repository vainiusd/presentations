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

echo "Deleteing iptables rules"
sudo iptables -t nat -F  POSTROUTING
sudo iptables -t nat -F  PREROUTING

echo "Stoping http servers"
sudo killall python3

echo "FINNISHED DEMO-2 CLEANUP"
