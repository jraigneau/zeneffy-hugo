---
date: 2010-10-29 17:11:35+00:00
slug: cloner-une-machine-virtuelle-ubuntudebian-dans-virtualbox
title: Cloner une machine virtuelle Ubuntu/Debian dans VirtualBox
tags:
- ubuntu
- virtualisation
---

Pour cloner une machine virtuelle dans [VirtualBox](http://www.virtualbox.org/), il suffit d'utiliser les outils d'administration (en mode ligne de commande)

	VBoxManage clonevdi "chemin absolu vers source.vdi" "chemin absolu vers cible.vdi"

Attention de bien respecter les chemins absolu pour ne pas avoir une erreur ```ERROR: Cannot register the hard disk```

Toutefois il y a une petite subtilité pour un clone Ubuntu et Debian en général. En effet par défaut les MAC adresses (qui changent pour chaque VM) sont enregistrées dans ```/etc/udev/rules.d/70-persistent-net.rules``` avec le formalisme suivant:


	SUBSYSTEM=="net", ACTION=="add", DRIVERS=="?*", ATTR{address}=="08:00:27:12:34:46", ATTR{type}=="1", KERNEL=="eth*", NAME="eth0"

Or en clonant la VM, une nouvelle adresse MAC est créée et ajoutée à ```70-persistent-net.rules``` lors du lancement de la nouvelle VM - on obtient alors

	SUBSYSTEM=="net", ACTION=="add", DRIVERS=="?*", ATTR{address}=="08:00:27:12:34:46", ATTR{type}=="1", KERNEL=="eth*", NAME="eth0"
	SUBSYSTEM=="net", ACTION=="add", DRIVERS=="?*", ATTR{address}=="08:00:28:24:47:67", ATTR{type}=="1", KERNEL=="eth*", NAME="eth1"

Le démon ```udev``` ne sait alors plus quelle carte réseau utilisé et donc aucune connexion n'est plus possible. Pour corriger, il suffit d'enlever la première ligne et de modifier la seconde en mettant ```eth0``` à la place de ```eth1```:

	SUBSYSTEM=="net", ACTION=="add", DRIVERS=="?*", ATTR{address}=="08:00:28:24:47:67", ATTR{type}=="1", KERNEL=="eth*", NAME="eth0"

et voilà !
