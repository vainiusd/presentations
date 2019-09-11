CON1="con1"
CON1_VETH="veth10"
VETH_TO_CON1="veth1"

CON2="con2"
CON2_VETH="veth20"
VETH_TO_CON2="veth2"

VIP="172.16.30.1"

if [ $(hostname) == "sd19node01" ]; then 
    NODE_IP="10.48.7.71"
    BRIDGE_SUBNET="172.16.1.0/24"
    BRIDGE_IP="172.16.1.1"
    BRIDGE_NAME="br1"
    CON1_IP="172.16.1.10"
    CON2_IP="172.16.1.20"
    TO_NODE_IP="10.48.7.72"
    TO_BRIDGE_SUBNET="172.16.2.0/24"
    TO_BRIDGE_IP="172.16.2.1"
    TO_CON1_IP="172.16.2.10"
    TO_CON2_IP="172.16.2.20"
elif [ $(hostname) == "sd19node02" ]; then 
    NODE_IP="10.48.7.72"
    BRIDGE_SUBNET="172.16.2.0/24"
    BRIDGE_IP="172.16.2.1"
    BRIDGE_NAME="br2"
    CON_IP="172.16.2.10"
    CON_IP="172.16.2.20"
    TO_NODE_IP="10.48.7.71"
    TO_BRIDGE_SUBNET="172.16.1.0/24"
    TO_BRIDGE_IP="172.16.1.1"
    TO_CON1_IP="172.16.1.10"
    TO_CON2_IP="172.16.1.20"
else 
    echo "Node not chosen"
fi
