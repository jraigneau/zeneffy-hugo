---
date: 2011-04-11 11:03:33+00:00
slug: extensions-de-base-sous-heroku
title: Extensions de base sous heroku
tags:
- outils
- devops
---

Voici quelques extensions que j'installe systématiquement sous Heroku:

Gestion des noms de domaine personalisés

	heroku addons:add custom_domains:basic

Gestion d'un cache via memcached

	heroku addons:add memcache:5mb

Visualisation de Meilleures logs

	heroku addons:add logging:expanded
<!--more-->  
Supervision applicative

	heroku addons:add newrelic:bronze

Envoi de mail

	heroku addons:add sendgrid:free


D'autres extension en béta, à étudier de près:

 * Release Management (gestion de version comme sur GAE): ```heroku addons:add releases:basic```
 * CloudMailin (Réception de mail): ```heroku addons:add cloudmailin:test```
 * Custom Error Pages (Gestion de pages de maintenance): ```heroku addons:add custom_error_pages```
 * PG Backups (Sauvegardes de la base de donnée): ```heroku addons:add pgbackups:basic```
