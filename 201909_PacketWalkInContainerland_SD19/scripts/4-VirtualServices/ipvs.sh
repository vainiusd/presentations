#!/bin/bash -e

. env.sh

echo "########################################"
echo " "
echo "Showing IPVS session statistics"
echo " "
echo "########################################"

sudo ipvsadm -L -n --stats
