---
date: 2015-12-02 07:39:21+00:00
slug: remplacement-emoncms
title: Remplacement de emoncms par Grafana+influxDB
tags:
- domotique
---
Utilisateur de [emoncms](http://emoncms.org/) comme solution de métrologie de mon installation domotique depuis quelques mois, j'ai décidé dernièrement de basculer sur une solution moins spécialisée et beaucoup plus ouverte, basée sur [influxDB](https://influxdb.com/) pour la partie stockage des données et sur le superbe [Grafana](http://grafana.org/) pour la partie affichage des indicateurs.

InfluxDB est une base de donnée permettant de stocker des données chronologiques (Time series en anglais), avec intégration de fonctions mathématiques simples (min/max, moyenne...), et un langage de requêtage proche du SQL et simple à utiliser.

Grafana est, quant à lui, un visualiseur de données, pouvant se connecter à Graphite, influxDB, openTSDB...afin de créer des tableaux de bord composés de graphiques ou de données brutes avec des possibilités avancées de corrélation.

L'installation de ces deux outils se fait très facilement (le classique `sudo apt-get sur ubuntu) et le paramétrage est aussi simple (du moins pour une installation comme la mienne) - aussi je ne n'épiloguerai pas dessus (en bref utilisation de [nodered](http://nodered.org/) ou de scripts bash pour récupérer les données puis envoi en POST via l'API influxDB, rien d'exotique).

Ainsi en quelques minutes, j'ai pu obtenir des tableaux de bord sur différents types de données, tant domotique qu'informatique, eg:

*Consommation électrique*

<img src="https://farm1.staticflickr.com/602/23106880869_9878c217b9.jpg" width="500" height="297" alt="graphana-elec">

*Traffic internet sur ma box*

<img src="https://farm1.staticflickr.com/683/23366332332_caa0a653e9.jpg" width="500" height="297" alt="grafana-traffic">

Pour conclure, ce qui me satisfait le plus dans cette solution c'est la possibilité de mettre n'importe quelle donnée en très peu de temps: utile parfois pour du troubleshooting.
