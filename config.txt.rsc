# jun/11/2024 14:37:19 by RouterOS 6.48.7
# software id = 44UU-TR2K
#
# model = RouterBOARD 941-2nD
# serial number = 8B0E08B7BB28
/interface wireless
set [ find default-name=wlan1 ] ssid=MikroTik
/interface vlan
add interface=ether2 name=VLAN10 vlan-id=10
add interface=ether2 name=VLAN20 vlan-id=20
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add name=dhcp_pool0 ranges=192.168.10.2-192.168.10.254
add name=dhcp_pool1 ranges=192.168.20.2-192.168.20.254
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no interface=VLAN10 lease-time=50m name=\
    dhcp1
add address-pool=dhcp_pool1 disabled=no interface=VLAN20 lease-time=50m name=\
    dhcp2
/ip address
add address=10.10.10.2 interface=ether4 network=10.10.10.0
add address=10.10.10.1 interface=ether3 network=10.10.10.0
add address=192.168.10.1/24 interface=VLAN10 network=192.168.10.0
add address=192.168.20.1/24 interface=VLAN20 network=192.168.20.0
/ip dhcp-client
add disabled=no interface=ether1
/ip dhcp-server network
add address=192.168.10.0/24 gateway=192.168.10.1
add address=192.168.20.0/24 gateway=192.168.20.1
/ip dns
set servers=8.8.8.8
/ip firewall nat
add action=masquerade chain=srcnat out-interface=ether1
/ip route
add distance=1 dst-address=192.168.10.0/24 gateway=VLAN10
add distance=1 dst-address=192.168.20.0/24 gateway=VLAN20
/system clock
set time-zone-name=Asia/Jakarta
