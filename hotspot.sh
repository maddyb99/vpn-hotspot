apt install network-manager -y
bash -c "echo 'network: {config: disabled}' > /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg"
cp netplan.yaml /etc/netplan/10-hotspot.yaml
netplan generate
netplan apply
echo 'net.ipv4.ip_forward = 1' | sudo tee -a /etc/sysctl.d/99-hotspot.conf
echo 'net.ipv6.conf.all.forwarding = 1' | sudo tee -a /etc/sysctl.d/99-hotspot.conf
sysctl -p /etc/sysctl.d/99-hotspot.conf
