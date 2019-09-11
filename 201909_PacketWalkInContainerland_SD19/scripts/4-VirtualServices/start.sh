#!/bin/bash -e 

. env.sh

echo "Creating the namespaces"
sudo ip netns add $CON1
sudo ip netns add $CON2

echo "Creating the veth pairs"
sudo ip link add $VETH_TO_CON1 type veth peer name $CON1_VETH
sudo ip link add $VETH_TO_CON2 type veth peer name $CON2_VETH

echo "Adding the veth pairs to the namespaces"
sudo ip link set $CON1_VETH netns $CON1
sudo ip link set $CON2_VETH netns $CON2

echo "Configuring the interfaces in the network namespaces with IP address"
sudo ip netns exec $CON1 ip addr add $CON1_IP/24 dev $CON1_VETH 
sudo ip netns exec $CON2 ip addr add $CON2_IP/24 dev $CON2_VETH

echo "Enabling the interfaces inside the network namespaces"
sudo ip netns exec $CON1 ip link set dev $CON1_VETH up
sudo ip netns exec $CON2 ip link set dev $CON2_VETH up

echo "Creating the bridge"
sudo ip link add name $BRIDGE_NAME type bridge

echo "Adding the network namespaces interfaces to the bridge"
sudo ip link set dev $VETH_TO_CON1 master $BRIDGE_NAME
sudo ip link set dev $VETH_TO_CON2 master $BRIDGE_NAME

echo "Assigning the IP address to the bridge"
sudo ip addr add $BRIDGE_IP/24 dev $BRIDGE_NAME

echo "Enabling the bridge"
sudo ip link set dev $BRIDGE_NAME up

echo "Enabling the interfaces connected to the bridge"
sudo ip link set dev $VETH_TO_CON1 up
sudo ip link set dev $VETH_TO_CON2 up

echo "Setting the loopback interfaces in the network namespaces"
sudo ip netns exec $CON1 ip link set lo up
sudo ip netns exec $CON2 ip link set lo up

echo "Setting the default route in the network namespaces"
sudo ip netns exec $CON1 ip route add default via $BRIDGE_IP dev $CON1_VETH
sudo ip netns exec $CON2 ip route add default via $BRIDGE_IP dev $CON2_VETH

# -------------------------- Node to node routing  ------------------------- #

echo "Setting the route on the node to reach the network namespaces on the other node"
sudo ip route add $TO_BRIDGE_SUBNET via $TO_NODE_IP dev ens160

# -------------------------- NS services  ---------------------------------- #

echo "Starting web servers in namespaces"
sudo ip netns exec $CON1 python3 -m http.server -d ~/CON1http/ 80 > /dev/null 2>&1 &
sudo ip netns exec $CON2 python3 -m http.server -d ~/CON2http/ 80 > /dev/null 2>&1 &

# -------------------------- IPVS services  ---------------------------------- #

echo "Creating virtual service for web server reachability"
sudo ipvsadm -A -t $VIP:80 -s rr
sudo ipvsadm -a -t $VIP:80 -r $CON1_IP -m
sudo ipvsadm -a -t $VIP:80 -r $CON2_IP -m
sudo ipvsadm -a -t $VIP:80 -r $TO_CON1_IP -m
sudo ipvsadm -a -t $VIP:80 -r $TO_CON2_IP -m

echo "FINNISED DEMO-4 SETUP"

