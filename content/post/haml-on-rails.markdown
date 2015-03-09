---
date: 2011-07-12 19:30:54+00:00
slug: haml-on-rails
title: Haml on Rails
tags:
- rubyonrails
---

Pour utiliser [haml](http://haml-lang.com/) avec [Ruby on Rails 3.x](http://rubyonrails.org/), il suffit d'ajouter dans le fichier ``GemFile``

	gem 'haml-rails'

puis lancer la commande ``bundle install``

et finalement ajouter

	config.generators do |g|
	  g.template_engine :haml
	end


dans le fichier ``config/application.rb`` (dans la classe ``Application < Rails::Application``) - chaque scaffold sera automatiquement en Haml
<!--more-->

