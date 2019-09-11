#!/bin/bash -e

. env.sh

echo "########################################"
echo " "
echo "HTTP requests to "$VIP" server"
echo " "
echo "########################################"

curl $VIP