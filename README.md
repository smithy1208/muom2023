# muom2023
**VRRP at RouterOS**

[info from help.mikrotik.com](https://help.mikrotik.com/docs/display/ROS/VRRP)

1. Отказоустойчивый шлюз с VRRP.
1. Синхронизация сonnection tracking.
1. VRRP over VLAN. Classic.
1. Group-master.
1. VLAN over VRRP. Рассмотрим плюсы и минусы.
1. VRRP v3 на link-local адресах (используем ipv6).
1. "Простой" способ синхронизации настроек.
1. [Способ обойтись только mikrotik](https://github.com/elmaxid/vrrp_with_sync_mikrotik).


## VRRP over VLAN

Cоздать vlan10, vlan20, vlan30, vlan40 и добавить на них ip адреса.
```
:for i from=10 to=40 step=10 do={ /int vlan add interface=ether2 name="vlan$i" vlan-id=$i; /ip add add interface="vlan$i" address="10.0.$i.1/24" }
```

Cоздать vrrp10, vrrp20, vrrp30, vrrp40 и добавить на них ip адреса.
```    
:for i from=10 to=40 step=10 do={/int vrrp add interface="vlan$i" name="vrrp$i" preemption-mode=no ; /ip add add interface="vrrp$i" address="10.0.$i.254/32"}  
```
