---
date: 2011-02-05 07:50:50+00:00
slug: application-sinatra-pour-heroku
title: Application Sinatra pour Heroku
tags:
- projets
- ruby
- rubyonrails
- sinatra
---

Dernièrement je m'intéresse au framework de développement  [sinatra](http://www.sinatrarb.com/) qui est basé sur le langage Ruby (comme Ruby on Rails donc). Sinatra est un [DSL](http://fr.wikipedia.org/wiki/Domain-specific_programming_language) permettant de développer rapidement et simplement des applications web (un peu comme [webpy](http://webpy.org/) que j'avais utilisé sur [Harpagon](https://github.com/jraigneau/Harpagon)).

Pour déployer des applications sinatra, j'ai décidé de continuer à m'appuyer sur la plate-forme d'hébergement [Heroku](http://heroku.com/) - voila les quelques fichiers à mettre en oeuvre pour une application minimale - en activant la supervision [newrelic_rpm](http://newrelic.com/):
<!--more-->
*heroku-sinatra-app.rb*

	require 'rubygems'
	require 'sinatra'

	configure :production do
	require 'newrelic_rpm'
	end

	# Quick test
	get '/' do
	"Hello from the ratpack!"
	end

*config.ru*

	require 'heroku-sinatra-app'
	run Sinatra::Application

*.gems*

	sinatra
	newrelic_rpm version

*newrelic.yml*

	# here are the settings that are common to all environments
	common: &default_settings
	  license_key: "<%= ENV['NEW_RELIC_LICENSE_KEY'] %>"
	  app_name: "<%= ENV['NEW_RELIC_APPNAME'] %>"
	  monitor_mode: false
	  developer_mode: false
	  log_level: info
	  apdex_t: 0.5
	  capture_params: false
	  transaction_tracer:
	    enabled: false
	  error_collector:
	    enabled: false

	production:
	  <<: *default_settings
	  monitor_mode: true

Il suffit ensuite de pousser ces fichiers via Git sur Heroku et de visiter l'url de votre application!
