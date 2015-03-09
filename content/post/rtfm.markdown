---
date: 2011-03-06 21:09:06+00:00
slug: rtfm
title: RTFM !!!
tags:
- bdd
- google
- projets
---

Dans un [billet précédent](Google App Engine: une demi-déception), je me plaignais de l'infrastructure google et en creusant un peu, j'ai découvert que mon problème venait de requête d'écriture à la base de donnée, qui à la première écriture de chaque session prenait jusqu'à 15 secondes.

En regardant de près la documentation de [datamapper](http://datamapper.org/), l'ORM utilisé pour [Veilleur](http://labs.zeneffy.fr/projets/veilleur), je me suis rendu que je n'utilisais pas correctement les requêtes avec les associations 1-n. En simplifiant, l'application récupérait la liste de toutes les valeurs des tests dans la base (1 toute les 10 minutes depuis 15 jours, faites le calcul...) avant d'écrire la nouvelle valeur - ce qui était inutile et surtout gourmant (15secondes !)

**Morale**: il faut bien lire les manuels et la documentation des frameworks, librairies...utilisés dans son code.
<!--more-->