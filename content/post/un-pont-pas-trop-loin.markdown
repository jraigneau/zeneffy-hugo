---
date: 2010-09-27 21:01:30+00:00
slug: un-pont-pas-trop-loin
title: Un pont (pas) trop loin
tags:
- domotique
- hardware
- réseau
---

Dans le cadre de ses nouvelles activités, ma femme a eu besoin que nous installions un bureau dans notre chambre. La partie ikea-choix-achat-montage s'étant passée presque sans accroc, j'ai changé le PC portable de place pour évidemment utiliser le bureau. Mauvaise surprise, le WiFi de la 9Box n'est pas accessible (trop de murs et trop de ferrite dans les murs).

Par chance, j'avais gardé un vieux routeur wifi [Linksys WRT54G](http://en.wikipedia.org/wiki/Linksys_WRT54G_series) - en cherchant un peu, j'ai trouvé d'une part qu'il existait des [firmwares opensource récents](http://www.dd-wrt.com/site/index) pour ce routeur et surtout qu'ils permettaient de faire un "Pont Répéteur WiFi" (Repeater Bridge pour les anglophones).

Un Pont Répéteur WiFi permet de lier un routeur secondaire au premier routeur (ici ma box) via WiFi: des clients peuvent alors se connecter au secondaire et profiter du DHCP, DNS et de la connexion internet du primaire - le WRT54G étant plus sensible au WiFi que mon PC il permet donc en d'autres termes de faire [relais WiFi](http://www.dd-wrt.com/wiki/index.php/Image:Repeater_Bridge.jpg).

Après quelques manipulations détaillées sur la [page dédiée du wifi](http://www.dd-wrt.com/wiki/index.php/Repeater_Bridge), j'ai pu faire fonctionner relativement facilement le linksys qui me permet maintenant d'écrire ce billet du bureau - la seule difficulté venant de la 9Box sur laquelle j'avais configuré des IP en DHCP et d'autres en statique, ces dernières posant problèmes pour accéder à internet (problème de route retour probablement).
