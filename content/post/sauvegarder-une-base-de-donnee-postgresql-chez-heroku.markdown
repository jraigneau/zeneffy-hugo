---
date: 2011-09-19 17:34:01+00:00
slug: sauvegarder-une-base-de-donnee-postgresql-chez-heroku
title: Sauvegarder une base de donnée PostgreSQL chez Heroku
tags:
- outils
- bdd
- backup
---

[Heroku](http://www.heroku.com) permet de faire très simplement des sauvegardes des bases de données de production en utilisant le module [PGBackups](http://addons.heroku.com/pgbackups).

Il faut d'abord installer le module soit via l'IHM web , soit via la commande ((dans le répertoire de l'application):

	heroku addons:add pgbackups

Puis simplement lancer une sauvegarde:

	heroku pgbackups:capture<!--more-->

Une petite vérification s'impose:

	heroku pgbackups


qui renvoie normalement:

	D   | Backup Time         | Size   | Database
	-----+---------------------+--------+----------------
	b001 | 2011/08/18 11:08.22 | 39.2KB | SHARED_DATABASE
	b002 | 2011/09/19 10:24.04 | 40.2KB | SHARED_DATABASE

Et finalement pour restaurer (avec b001 la base):

	heroku pgbackups:restore DATABASE b001

Rappelez vous que la sauvegarde reste l'un des meilleurs moyens de sécuriser vos données.
