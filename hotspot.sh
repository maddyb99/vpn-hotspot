apt install network-manager -y
bash -c "echo 'network: {config: disabled}' > /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg"
cp netplan.yaml /etc/netplan/10-hotspot.yaml
netplan generate
netplan apply
./vpn.sh $1 $2
systemctl restart NetworkManager
