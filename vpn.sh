#!/bin/bash
curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/$(lsb_release -cs).noarmor.gpg | tee /usr/share/keyrings/tailscale-archive-keyring.gpg >/dev/null
curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/$(lsb_release -cs).tailscale-keyring.list | tee /etc/apt/sources.list.d/tailscale.list >/dev/null
apt update
apt install tailscale network-manager firewalld -y

#if you want to expose subnet routes
echo 'net.ipv4.ip_forward = 1' | tee -a /etc/sysctl.d/99-tailscale.conf
echo 'net.ipv6.conf.all.forwarding = 1' | tee -a /etc/sysctl.d/99-tailscale.conf
sysctl -p /etc/sysctl.d/99-tailscale.conf
firewall-cmd --permanent --add-masquerade
#end of subnet routes

tailscale up --auth-key=$1
#for some reason, running the below command directly breaks averything
tailscale up --auth-key=$1 --exit-node=$2 --accept-routes=true --accept-dns=true --exit-node-allow-lan-access=true 

systemctl restart NetworkManager
