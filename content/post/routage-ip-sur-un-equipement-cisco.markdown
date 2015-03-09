---
date: 2009-05-07 13:31:00+00:00
slug: routage-ip-sur-un-equipement-cisco
title: Routage IP sur un équipement cisco
tags:
- formation
- réseau
---

### Commandes diverses de configuration


passage en mode root: ```enable```

effacer conf: ```erase startup```

rentrer mode configuration: ```conf t```

info sur interface en mode configuration: ```do show ip interface brief```

rentrer en config d'interface FastEthernet0: ```interface fa0```

config IP + submask: ```ip address 10.0.0.1 255.255.255.0```

no shut du port fa0: ```no shutdown```

### ARP


```show arp```

sous windows: ```arp -a```

information sur interfaces: ```show interface```

table de mac: ```show mac-address-table```


### configuration routeur cisco


sauvegarde configuration: ```copy run start```

(ne pas changer le nom)

config password sur routeur: 

	enable
	conf t
	line vty 0 4
	password cisco
	exit
	enable password line

### Configuration routes statiques


sur Serial 0 S0

	enable
	conf t
	interface s0
	ip address 172.16.2.1 255.255.255.0
	no shutdown
	ip route 10.0.3.0 255.255.255.0 172.16.2.2
	show ip route

côté DCE; penser à configurer l'horloge (clock rate) si côté opérateur (DCE)


### Routage dynamique rip

	enable
	conf t
	router rip
	network 10.0.0.0
	network 172.16.2.0

#passage en rip v2

	version 2

#nécessite de passer en mode complet (non resumé, ce qui évite de résumer les routes à /8)

	no auto-summary
	mode debug
	enable
	debug ip rip

### Routage dynamique OSPF

![](http://lh3.ggpht.com/_RTJjPWCgPV8/S6y4X1I77rI/AAAAAAAAGU8/Q6kMpYv_lhU/s800/Diapositive1_cisco.png)

**Routes dynamiques avec une seule zone**

	router ospf 999 (process id)

	network 10.1.0.1 0.0.0.0 area 0

	network 172.16.2.1 0.0.0.0 area 0

	network 192.168.2.1 0.0.0.0 area 0

voir les routes protocolaires

	show ip protocol


**avec plusieurs area**

![](http://lh6.ggpht.com/_RTJjPWCgPV8/S6y4X2_-QRI/AAAAAAAAGVA/sgYojH5G4ww/s800/Diapositive2_cisco.png)

**Routes dynamiques avec plusieurs zones**

	network 10.1.0.1 0.0.0.0 area 1
	network 172.16.2.1 0.0.0.0 area 1
	network 192.168.2.1 0.0.0.0 area 0

### Configuration internet - via PAT


sur routeur Area 0: passage en mode DHCP sur interface fa0

![](http://lh3.ggpht.com/_RTJjPWCgPV8/S6y4YJHSrEI/AAAAAAAAGVE/Zh9pga9hMZE/s800/Diapositive3_cisco.png)


**Accès internet via un autre routeur externe**

	interface fa0
	ip address dhcp

Récupérer les DNS

	show dhcp server

construction route par défaut et distribution via ospf

	router ospf 1
	default-information originate

Configration nat (intérieur du réseau => serial)

	interface S1
	ip nat inside

Modification vitesse sérial

	clock rate 8000000

configuration nat vers extérieur

	interface fa0
	ip nat outside

Création du pool "overload" => c'est ce qui définit le PAT + access list sur réseau 10.0.0.0

	ip nat inside source list 1 interface fa0 overload
	access-list 1 permit 10.0.0.0 0.0.0.255

**Config DHCP avec relais**

Sur DHCP principal (dans zone 0)

	ip dhcp pool toto
	network 10.0.0.0 255.255.255.0
	default-router 10.0.0.1
	dns-server 212.27.40.241 212.27.40.240

Sur relais

	interface fa0
	ip helper-address 192.168.2.254

**Gestion IPv6**

	ipv6 unicast-routing
	ipv6 address 2001:0410:0001:3::/64 eui-64

prefix sur 64 + eui-64 créé à partir de la MAC address = ip sur 128 bits

configuration interface loopback

	interface loopback 0
	ipv6 address 2001:0410:0001:1::/64 eui-64