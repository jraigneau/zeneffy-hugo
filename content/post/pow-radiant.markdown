---
date: 2011-06-14 20:51:30+00:00
slug: pow-radiant
title: Pow & Radiant
tags:
- node.js
- rubyonrails
- sinatra
---

J'ai découvert dernièrement le serveur de développement [Pow](http://pow.cx/) qui permet très simplement de mettre en place un serveur Rack (pour les applications Ruby comme [sinatra](http://www.sinatrarb.com/) ou [Rails](http://rubyonrails.org/)) sur un Mac sans aucune configuration. 

Par contre il peut réserver quelques surprises de configuration, notamment avec [Radiant](http://radiantcms.org/). Deux points à retenir (en tout cas jusqu'à présent:
<!--more-->  
  1. Il faut désactiver le cache en développement sinon cela provoque des erreurs aléatoires de chargement des pages - dans ```config/environements/development.rb``` mettre ```config.cache_classes = true```
  2. Il est nécessaire d'ajouter un fichier config.ru juste pour le développement et surtout ne pas le copier en production, sinon cela empèche les contenus statiques de s'afficher (images, css et javascripts donc!) avec un fichier ```config.ru```

		# Rails.root/config.ru
		require "./config/environment"
		run ActionController::Dispatcher.new

Sinon, basé sur [node.js](http://nodejs.org/), Pow est efficace et permet d'accéder à l'ensemble des applications en même temps via des url du type http://monappli.dev: je le recommande donc vivement pour se faciliter la vie de développeur Ruby.
