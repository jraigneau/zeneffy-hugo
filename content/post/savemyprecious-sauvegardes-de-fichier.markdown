---
date: 2009-07-04 14:45:05+00:00
slug: savemyprecious-sauvegardes-de-fichier
title: SaveMyPrecious - Sauvegardes de fichier
tags:
- projets
- python
---

SaveMyPrecious remplace [Saise](http://blog.zeneffy.fr/2008/09/saise-sauvegarde-incrementale-securisee/) et permet donc une sauvegarde incrémentale totale (chaque sauvegarde se suffit à elle même) distante via l'utilisation de la commande cp -al et de rsync. Les principes de base sont expliqués sur la page de présentation d'[Obiran](http://blog.zeneffy.fr/2008/05/obiran-outil-de-backup-incremental-en-ruby/), le premier script de sauvegarde que j'ai écrit.

A l'inverse de Saise, SaveMyPrecious ne crypte pas les données, mais subit une nette amélioration de l'interface graphique.

**Dépendances**

Pour faire fonctionner SaveMyPrecious, il vous faut:



	
  * SaveMyPrecious

	
  * rsync

	
  * ssh

	
  * libraires python: [pynotify](http://roscidus.com/desktop/node/336) et pygtk


**Où trouver SaveMyPrecious ?**

Le code est disponible en open source [sous license Apache](http://fr.wikipedia.org/wiki/Licence_Apache) sur [Zeneffy::Labs](http://labs.zeneffy.fr/wiki/savemyprecious)

Le code est sans garantie et sans support.
