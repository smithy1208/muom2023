# 2023-07-08 18:56:18 by RouterOS 7.10.1
# software id = 
#
/interface vrrp add interface=ether2 name=vrrp1 preemption-mode=no
/interface wireless security-profiles set [ find default=yes ] supplicant-identity=MikroTik
/ip pool add name=dhcp_pool0 ranges=10.0.0.33-10.0.0.222
/ip dhcp-server add address-pool=dhcp_pool0 interface=ether2 lease-time=3h name=dhcp1
/ip address add address=10.0.0.1/24 interface=ether2 network=10.0.0.0
/ip address add address=10.0.0.254 interface=vrrp1 network=10.0.0.254
/ip dhcp-client add interface=ether1
/ip dhcp-server network add address=10.0.0.0/24 dns-server=77.88.8.8,77.88.8.1 gateway=10.0.0.254
/ip firewall filter add action=passthrough chain=input protocol=icmp
/ip firewall nat add action=masquerade chain=srcnat out-interface=ether1
/system identity set name=chr1
/system note set show-at-login=no
/tool romon set enabled=yes
