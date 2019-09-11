#!/bin/bash -e 

. env.sh

echo "########################################"
echo " "
echo "IPtable entries in NAT table"
echo " "
echo "########################################"
sudo iptables -vL -t nat


