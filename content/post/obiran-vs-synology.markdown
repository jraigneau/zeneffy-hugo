---
date : "2015-04-04T20:17:05+01:00"
slug : obiran-vs-synology
title : Obiran versus synology
tags:
- projets
- devops
- backup
---
Depuis quelques mois, j’ai mis en oeuvre une nouvelle infrastructure chez moi de type [homelab](http://techhead.co/vmware-esxi-home-lab-why-what-and-how-considerations-when-building-your-own-home-lab/), basée sur un petit serveur intel NUC, ESXi et Ubuntu.

Comme tout bon exploitant avec des tendances [devops](/tags/devops), j’ai rajouté de la supervision avec [NewRelic](http://newrelic.com/server-monitoring), divers scripts de contrôle, un dashboard basé sur [dashing](http://dashing.io/), l’installation automatisée de VM via [ansible](http://www.ansible.com/home) et évidemment je me suis ensuite attaqué à la problématique des sauvegardes.

De nombreuses solutions opensource existent déjà ([amanda](http://www.amanda.org/), [bacula](http://www.baculasystems.com/) …) permettant entre autre d’avoir une architecture de type client-serveur. Toutefois, la sauvegarde étant un sujet qui me tient à [coeur](http://www.zeneffy.fr/tags/backup/), j’ai décidé de réutiliser un de mes scripts assez ancien « [obiran](/2008/05/obiran-outil-de-backup-incremental-en-ruby/) » pour sauvegarder les fichiers importants directement sur mon NAS Synology.

Mais la mauvaise fée de l’informatique est intervenu d’un coup de baguette numérique rendant impossible de faire fonctionner ``rsync`` entre mes VM et le NAS, avec un message d’erreur peu parlant du type ``Permission denied, please try again.``

Après quelques recherches, la solution semble être d’expliciter le chemin du binaire ``rsync`` côté synology, avec le paramètre ``—rsync-path=/usr/syno/bin/rsync``. La commande à lancer devient donc:

	rsync -azv —rsync-path=/usr/syno/bin/rsync REPERTOIRE_A_SAUVEGARDER -e « ssh -p PORT -i FICHIER-CLEF » USER@SYNOLOGY:REPERTOIRE_DESTINATION

J’ai donc mis à jour Obiran avec un nouveau paramètre pour prendre en compte cette spécificité: Obiran est donc passé en version 0.6, sept ans avec la version 0.5 !
