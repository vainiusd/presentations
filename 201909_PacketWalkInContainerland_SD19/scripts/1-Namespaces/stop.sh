#!/bin/bash

. env.sh

echo "Deleting the namespaces"
ip netns list | grep $CON1
if [ $? -eq 0 ]; then
	    sudo ip netns delete $CON1
    fi

echo "FINNISHED DEMO-1 CLEANUP"
