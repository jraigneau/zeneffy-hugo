---
date : "2015-04-16T22:06:42+02:00"
tags : 
- projets
- domotique
title : Mon datacenter
slug : mon-datacenter
---
#### le datacenter à la maison : un rêve de geek
Ayant acheté une maison l’année dernière avec beaucoup d’espace et surtout un grand garage, j’en ai profité pour réaliser un vieux fantasme de geek : Avoir un endroit dédié pour mon matériel informatique, bref mon propre mini datacenter.

Derrière ce fantasme, un besoin simple: créer un espace protégé, ventilé et [présentable](http://fr.wikipedia.org/wiki/Facteur_d%27acceptation_f%C3%A9minine) pour héberger un NAS Synology, un  mini-serveur NUC, un antenne RFXCom pour la domotique, un hub NetGear et un UPS APC - le tout avec des capacités d’évolution et en respectant certaines règles d’urbanisation. En bonus, un vieux PC avec hauts-parleurs est installé pour me permettre d’écouter de la musique en bricolant ou pour consulter rapidement des infos domotiques.

<img src="https://farm9.staticflickr.com/8708/16972064590_a4f1719aec_z.jpg" width="640" height="478" alt="datacenter1" align="middle">

#### De la « récup » et de l’huile de coude
Après quelques recherches sur internet sur le sujet, j’ai trouvé de nombreux exemples de bricoleurs geek qui ont transformé (ou même créé) des meubles pour cette usage: j’ai donc décidé de me lancer moi aussi en partant d’un petit meuble existant.

Quatre étapes majeures ont composé la création de ce meuble datacenter:

1. Créer les aérations et prévoir les circulations d’air
2. Structurer le câblage des courants forts (électricité) et faibles (réseau)
3. Mettre en place le matériel
4. Installer le PC « domotique »

#### Une aération intelligente
Tout d’abord, j’ai percé des ouvertures sur la porte avant, sur l’arrière pour le passage des câbles.

<img src="https://farm9.staticflickr.com/8732/16539846743_53e48f0cb9_n.jpg" width="320" height="239" alt="IMG_0786">
<img src="https://farm8.staticflickr.com/7710/17159850705_0d20c08d1b_n.jpg" width="239" height="320" alt="IMG_0812">

Puis j’ai rajouté une VMC de salle de bain pour assurer extraction d’air optimale, avec un allumage automatique via un [micro-module Chacon](http://www.amazon.fr/Myfox-TA3010-62592-Module-1000/dp/B0033ZREXU/ref=pd_sim_hi_1?ie=UTF8&refRID=1R4NH6AP9KE53T4K6F7K) commandé par la box domotique open-source [Domoticz](http://domoticz.com/) et basé sur un capteur de température [Oregon Scientific](http://www.amazon.fr/Oregon-Scientific-THN-D%C3%A9tecteur-temp%C3%A9rature/dp/B000PEDJVI).

<img src="https://farm8.staticflickr.com/7637/16972282098_f363ed97bb_z.jpg" width="640" height="478" alt="IMG_0818">

Grâce à ce montage, la VMC ne se déclenche que si la température à l’intérieur du DC dépasse les 30°C et s’éteint une fois la température revenue sous les 27°C, tout en m’envoyant des alertes.

<img src="https://farm9.staticflickr.com/8701/16539781163_9c69f57da3_c.jpg" width="800" height="221" alt="Domoticz">

#### L’importance d’optimiser son câblage
Qui n’a jamais eu de problème de câble qui se mélangent, s’entortillent et se croisent (regardez donc les câbles entre votre télévision, votre box tv et votre lecteur de DVD par exemple)? Sur un environnement confiné avec à la fois des câbles électriques et des câbles réseau, cela peut devenir l’enfer en cas de modification ou de dépannage.

<img src="https://farm9.staticflickr.com/8765/17159460861_efc4b76ef2_z.jpg" width="640" height="478" alt="IMG_0817">

Aussi j’ai utilisé des accroches de tuyaux de plomberie pour définir des chemins de câbles, en séparant courant faible et courant fort - ce qui m’a permis notamment de changer plusieurs fois des éléments dans le datacenter sans coup férir.

#### Organisation et remplissage du datacenter
Avant de remplir, j’ai rajouté des roulettes pour faciliter les manipulations.

<img src="https://farm8.staticflickr.com/7612/17160121785_315be2a776_z.jpg" width="640" height="478" alt="IMG_0785">

Puis, J'ai positionné l'UPS en bas, le NUC au milieu avec le NAS et pour l'instant juste le switch réseau en haut: l'idée étant de garder de la place à côté du NUC et du switch pour des évolutions.

<img src="https://farm8.staticflickr.com/7703/16550162503_48d1435116_z.jpg" width="478" height="640" alt="IMG_0001">

Vous noterez le capteur de température pour le déclenchement de la VMC juste au dessus du NUC.

#### Un PC facile d’accès
Avoir un PC dans le garage/atelier peut être pratique pour accéder rapidement à un terminal, vérifier des points sur internet lors du bricolage ou simplement écouter de la musique.

Pour cela, un peu de récupération avec une planche pour le moniteur et une plaque de métal pour le clavier, le tout fixé au mur au dessus du datacenter pour avoir le réseau et le tour est joué !

<img src="https://farm8.staticflickr.com/7701/16547925704_5a723568a9_z.jpg" width="478" height="640" alt="IMG_0002">

Ce système permet aussi de positionner le boîtier radio RFXcom en dehors du meuble pour éviter les interférences. 

#### Résultats
Les objectifs sont tous atteints, avec finalement peu de moyens engagés (moins de 80€ de matériel) et un résultat très correct.

<img src="https://farm8.staticflickr.com/7613/16984219739_fbf422e7f9_z.jpg" width="478" height="640" alt="IMG_0003">

Je réfléchis maintenant à acheter un mini-PC pas cher pour remplacer le vieux Celeron 1Go qui peine même sous linux.

