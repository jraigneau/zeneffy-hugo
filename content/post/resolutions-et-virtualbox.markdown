---
date: 2010-05-19 09:51:21+00:00
slug: resolutions-et-virtualbox
title: Résolutions et VirtualBox
tags:
- ubuntu
- virtualisation
---

Suite à l'[installation de Ubuntu 10.04 sous VirtualBox](http://blog.zeneffy.fr/2010/05/16/personnaliser-linstallation-de-ubuntu-10-04/), je me suis un peu battu pour avoir une résolution correcte en mode plein écran (aka 1280x800 sur mon portable).

Voici ce que j'ai trouvé: tout d'abord il faut rajouter la résolution nécessaire:

	VBoxManage setextradata "Ubuntu104" "CustomVideoMode1" "1280x800x24"

Puis suite à des problèmes de curseur de souris bloqué par des bords invisibles:

	VBoxManage controlvm "Ubuntu104" setvideomodehint 1280 800 24

Par contre je suis obligé de lancer la dernière commande à chaque fois - pas de solution miracle pour l'instant.
