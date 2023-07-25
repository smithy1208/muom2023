# 2023-07-08 20:14:50 by RouterOS 7.10.1
# software id = 
#
/interface ethernet set [ find default-name=ether1 ] comment=ISP
/interface ethernet set [ find default-name=ether2 ] comment=LAN
/interface vrrp add group-authority=self interface=ether2 name=vrrp1 preemption-mode=no remote-address=10.0.0.2 sync-connection-tracking=yes
/interface vlan add interface=vrrp1 name=vlan10 vlan-id=10
/interface vlan add interface=vrrp1 name=vlan20 vlan-id=20
/interface vlan add interface=vrrp1 name=vlan30 vlan-id=30
/interface vlan add interface=vrrp1 name=vlan40 vlan-id=40
/interface wireless security-profiles set [ find default=yes ] supplicant-identity=MikroTik
/ip pool add name=dhcp_pool0 ranges=10.0.0.33-10.0.0.222
/ip dhcp-server add address-pool=dhcp_pool0 interface=ether2 lease-time=3h name=dhcp1
/ip firewall connection tracking set enabled=yes
/ip address add address=10.0.0.1/24 interface=ether2 network=10.0.0.0
/ip address add address=10.0.0.254 interface=vrrp1 network=10.0.0.254
/ip address add address=10.0.10.1/24 interface=vlan10 network=10.0.10.0
/ip address add address=10.0.20.1/24 interface=vlan20 network=10.0.20.0
/ip address add address=10.0.30.1/24 interface=vlan30 network=10.0.30.0
/ip address add address=10.0.40.1/24 interface=vlan40 network=10.0.40.0
/ip dhcp-client add interface=ether1
/ip dhcp-server network add address=10.0.0.0/24 dns-server=77.88.8.8,77.88.8.1 gateway=10.0.0.254
/ip firewall filter add action=passthrough chain=input protocol=icmp
/ip firewall nat add action=masquerade chain=srcnat out-interface=ether1
/system identity set name=chr1
/system note set show-at-login=no
/tool romon set enabled=yes
