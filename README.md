# VPN Hotspot

## The Idea

So i run a home lab which backs up all of my devices, they are all connected via tailscale, which means I have to install tailscale on each and every client.
Let's say I create a hotspot from a raspberry pi which is connected to this network and all the devices connect to this.
This way we can have all devices connected to the VPN without install.

## How to use

Update the netplan.yaml file for yourself, it will contain your hotspot name and password.
Get a raspberry pi with ubuntu server
Run the following:

chmod +x *
sudo ./hotspot.sh
sudo vpn.sh <your_tailscale_key> <your_exit_node_ip>
