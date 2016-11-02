---
date: 2016-04-02T14:17:38+02:00
slug: godillot
title: Godillot, une alternative à M/Monit
tags:
- go
- projets
- outils
---

Suite à une coupure de courant le mois dernier, suffisamment longue pour vider la batterie de l'UPS, mes systèmes ont tous redémarrés automatiquement - ou du moins je le croyais jusqu'à ce que je me rende compte quelques jours plus tard que la base [influxDB](http://influxdb.com/) ne tournait plus, plantée suite à la coupure.

Après avoir réparé cette base de donnée (et avoir mis en oeuvre un vrai [système de backup](https://docs.influxdata.com/influxdb/v0.11/administration/backup_and_restore/) sur les data influxdb...), j'ai décidé d'installer un système de monitoring simple des processus avec [Monit](https://mmonit.com/monit/).

[Monit](https://mmonit.com/monit/). est un agent qui vérifie régulièrement les processus (Existence, Consommation, Code erreur), et envoie des alertes en cas de problèmes...bref rien de plus que Nagios ou [New Relic](http://newrelic.com), sauf que [Monit](https://mmonit.com/monit/). peut aussi lancer des actions comme relancer les processus en cas de problèmes ou de dépassement de seuil. Dans le cas d'une infrastructure peu administrée/monitorée comme la mienne cela devient très intéressant pour automatiser et se faciliter la vie.

Toutefois, [Monit](https://mmonit.com/monit/) a un inconvénient majeur: pour avoir une vision globale de l'état de l'ensemble des serveurs il faut utiliser [M/Monit](https://mmonit.com/) qui est payant.

Aussi, j'ai développé en langage [Go](http://golang.org) une mini application appelée [Godillot](https://github.com/jraigneau/godillot) qui récupère les informations Monit de chaque serveur et les agrège dans un fichier html simple à lire comme vous pourrez le voir [en exemple](http://godillot.zeneffy.fr). [Godillot](https://github.com/jraigneau/godillot) n'a pas vocation à remplacer M/Monit qui est très complet mais permet d'assurer un minimum de surveillance via u tableau de bord.

Godillot est bien entendu disponible en open-source (Licence Apache), directement sur [Github](https://github.com/jraigneau/godillot), pour utilisation, modification (je ne suis pas fier du template html) et commentaires à votre convenance !


