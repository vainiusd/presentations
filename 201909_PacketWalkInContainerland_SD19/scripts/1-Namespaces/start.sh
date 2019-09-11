#!/bin/bash -e 

. env.sh

echo "Creating the namespace "$CON1
sudo ip netns add $CON1

echo "Creating the veth pair" $VETH_TO_CON1 " and " $CON1_VETH
sudo ip link add $VETH_TO_CON1 type veth peer name $CON1_VETH

echo "Adding one end of the veth pair to the namespace"
sudo ip link set $CON1_VETH netns $CON1

echo "Configuring the interface in the network namespace with an IP address"
sudo ip netns exec $CON1 ip addr add $CON1_IP dev $CON1_VETH

echo "Enabling the interface inside the network namespace"
sudo ip netns exec $CON1 ip link set dev $CON1_VETH up

echo "Enabling the interface on the node"
sudo ip link set dev $VETH_TO_CON1 up

echo "Setting the loopback interface in the network namespace"
sudo ip netns exec $CON1 ip link set lo up

echo "Setting the routes on the node"
sudo ip route add $CON1_IP/32 dev $VETH_TO_CON1

echo "Setting the default route in the network namespaces"
sudo ip netns exec $CON1 ip route add default via $CON1_IP dev $CON1_VETH

echo "FINISHED DEMO-1 SETUP"
