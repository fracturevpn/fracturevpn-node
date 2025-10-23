#!/bin/bash
# install-node.sh
apt update -y
apt install -y wireguard
wg genkey | tee private.key | wg pubkey > public.key
PRIVATE=$(cat private.key)
cat > /etc/wireguard/wg0.conf << EOF
[Interface]
PrivateKey = $PRIVATE
Address = 10.0.0.2/32
ListenPort = 51820
EOF
wg-quick up wg0
echo "Node LIVE"
