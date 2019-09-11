#!/bin/bash -e

######################
#
#    Run on NODE02
#
######################

. env.sh

echo "########################################"
echo " "
echo "  Running tshark command in Node02 NS" $CON1
echo " "
echo "########################################"

sudo ip netns exec $CON1 tshark -T fields -e ip.src -e ip.dst -e ip.proto -e icmp.type
