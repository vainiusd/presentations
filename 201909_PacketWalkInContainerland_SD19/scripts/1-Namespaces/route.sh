#!/bin/bash -e 

. env.sh

echo "########################################"
echo " "
echo "Routes in namespace "$CON1
echo " "
echo "########################################"
sudo ip netns exec $CON1 ip route
