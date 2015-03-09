---
date: 2011-02-05 07:33:43+00:00
slug: convertir-en-masse-des-videos
title: Convertir en masse des vidéos
tags:
- bash
- snippets
---

Pour rendre disponible des films sur ma télévision [Sony](http://www.erenumerique.fr/televiseur_sony_kdl40w5500_la_qualite_au_meilleur_prix-art-2302-1.html) via mon [NAS Synology](http://www.synology.com/enu/products/DS211j/index.php), j'ai été obligé de transformer mes vidéos du format AVI au format MPG pour être lisible via [DLNA](http://fr.wikipedia.org/wiki/Digital_Living_Network_Alliance).

J'ai utilisé la ligne de commande suivante:

	/usr/bin/ffmpeg -i "film.avi" -f dvd -vcodec mpeg2video -r 25.00 -s 352x576 -aspect 16:9 -b 4000kb -mbd rd -trellis -mv0 -cmp 2 -subcmp 2 -acodec mp2 -ab 192kb -ar 48000 -ac 2 "film.mpg"

Il suffit ensuite de créer un script bash contenant les commandes...et d'attendre la fin de convertion!
A noter que l'application [WinFF](http://winff.org/html_new/) permet entre autres de créer ces lignes de commandes.
<!--more-->