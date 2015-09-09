---
date : "2015-06-20T21:31:23+02:00"
title : Premiers pas en domotique
tags :
- domotique
- mes-projets
---
J'ai décidé l'année dernière de me lancer dans l'aventure de la [domotique](/tags/domotique), avec pleins d'idées en tête sur la sécurité et la détection, les mesures de température, l'optimisation de la consommation de l'énergie, le contrôle des lampes et autres, et plus globalement l’automatisation.

#### Étude préalable
En m'intéressant à ce domaine, j'ai découvert d'une part sa richesse et d'autre part le nombre très important de protocoles, les différentes box domotiques plus ou moins compatibles, les prix (élevés) des différents composants.

Par ailleurs, ce domaine est à la fois très récent et assez ancien et nécessite des connaissances en électronique, électricité, informatique avec une notion forte d'intégration de composants et systèmes entre eux… ce qui rend le sujet d'autant plus intéressant.

J'en ai tiré plusieurs postulats et décisions sur la suite des événements.

#### Postulats / Choix
Le matériel de contrôle de la bureautique pouvant être envahissant, j'ai décidé en premier lieu de me créer [mon propre espace](/2015/04/mon-datacenter/) pour le matériel.

Utilisateur heureux de l’open-source depuis plusieurs années, j'ai choisi de faire ma propre box domotique
open-source en me basant sur l'application [domoticz](http://domoticz.com/) pour le cœur du système et en rajoutant au fur et à mesure des applications dédiées par fonction (Surveillance, Graph, Ordonnancement).

Toutes ces applications sont installées sur des machines virtuelles Ubuntu/Linux sur un ESX VMware.
L'ESX est le seul élément non open-source, choisi par rapport à mes expériences professionnelles, mais j'aurai pu (dû?) choisir à la place [XEN](http://www.xenproject.org/).

Le dernier choix important a été pour moi d'isoler complètement la maison: aucun des systèmes domestiques n'est accessible de l'extérieur afin d'éviter tout piratage qui pourrait être particulièrement grave.

#### Mesurer pour contrôler
> *Measurement is the first step that leads to control and eventually to improvement. If you can’t measure something, you can’t understand it. If you can’t understand it, you can’t control it. If you can’t control it, you can’t improve it — Dr. H. James Harrington*

Un premier point important de la domotique est la mesure, selon l'adage *On ne contrôle que ce qu'on peut mesurer*. Il faut donc prévoir les capteurs (avec par exemple les mesures de température via des Oregon Scientific THN 132) et surtout l'infrastructure de collecte des données.

Dans mon cas, j'ai choisi de mettre en œuvre [emoncms](http://emoncms.org/), qui me permet d'agréger l'ensemble des données et d'en tirer des tableaux de bord très lisibles.

<img src="https://c1.staticflickr.com/1/461/18397964043_7c43f8dea1.jpg" width="500" height="207" alt="conso Electrique">

Évidemment, ces tableaux de bord ne sont pas accessibles de l'extérieur comme définit précédemment: j'ai donc mis en œuvre une copie des données temps réel vers l'extérieur, via un simple push vers un tableau de bord type [dashing](http://dashing.io/) hébergé chez [Heroku](http://www.heroku.co). 

<img src="https://c1.staticflickr.com/1/537/18397961713_b644294b27.jpg" width="500" height="276" alt="temperature">

#### Intégration des systèmes
Pour bien gérer "l'[internet of things](https://en.wikipedia.org/wiki/Internet_of_Things)" et mixer les services logiciels, les objets connectés, et les différents capteurs, j'ai par ailleurs installé [node-red](http://nodered.org/), qui est développé par IBM.

Node-red permet de créer des workflows entre objet pour les faire interagir entre eux simple, le tout via une IHM web. Ces workflows permettent via un peu de développement très simple en javascript d'analyser des flux de données venant de sondes ou de services, de les transformer avant de les renvoyer vers d'autres sondes ou services.

<img src="http://nodered.org/images/node-red-screenshot-sm.png" alt="nodered">

Ainsi, j'ai pu créer des flux pour récupérer les données de la box domotique avant de les envoyer vers emoncms et d'en faire des graphiques et des premières analyses.

#### Réalisations actuelles - plutôt orientées mesures
Ces derniers mois, je me suis attaché à mettre en œuvre les différents points de mesure, avec notamment:

* Mesures de la température dans toutes les pièces de vie (Chambres, Salon) via des sondes [Oregon Scientific](http://www.amazon.fr/Oregon-Scientific-THN-D%C3%A9tecteur-temp%C3%A9rature/dp/B000PEDJVI)
* Récupération de la consommation électrique directement sur le compteur avec une pince ampérométrique de chez [OWL](http://www.amazon.fr/dp/B006R7E8MG/ref=pe_386181_37038081_TE_3p_dp_1)

J'ai par ailleurs commencé à installer des caméras intérieures pour la vidéosurveillance, avec [motion](http://www.lavrsen.dk/foswiki/bin/view/Motion/WebHome) et [motioneye](https://github.com/ccrisan/motioneye) pour gérer les détections et l'enregistrement des films. Ces films sont enregistrés à la fois en local et sur une DropBox dédiée en cas de coupure (ou disparition du disque dur...)

<img src="https://github.com/ccrisan/motioneye/wiki/images/desktop-view.png" width="500" height="276" alt="motioneye">

#### Réalisations à venir ou qui reste à étudier
Le champ des possibles de la domotique est impressionnant et j'imagine par exemple mettre en œuvre d'autres activités comme: 

* Contrôle automatique des lumières du jardin selon l'heure de la journée.
* Mise en œuvre d'un contrôle vocal type [S.A.R.A.H](http://blog.encausse.net/s-a-r-a-h/)
* Extension de la vidéo surveillance à l'extérieure, avec déclenchement d'actions suite à des événements
* Mesure de l'humidité dans la salle de douche pour allumer/éteindre la VMC
* Contrôle des radiateurs via boutons électroniques
* Détection des lumières laissées allumées par les enfants
* Automatisation des fermetures de volets
* envoi d'information via SMS
* ....
Bref, de quoi s'occuper quelques temps !
