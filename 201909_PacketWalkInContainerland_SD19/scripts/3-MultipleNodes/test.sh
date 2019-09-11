#!/bin/bash -e

######################
#
#    Run on NODE01
#
######################

. env.sh

echo "########################################"
echo " "
echo "  Testing reachability from NS "$CON1" to Node02 NS "$CON1
echo " "
echo "########################################"

sudo ip netns exec $CON1 ping $TO_CON1_IP

