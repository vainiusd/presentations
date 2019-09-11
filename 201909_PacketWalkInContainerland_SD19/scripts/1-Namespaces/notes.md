sudo tshark -T fields -e ip.src -e ip.dst -e ip.proto -e icmp.type -i ens160
