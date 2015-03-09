---
date: 2011-04-13 11:09:20+00:00
slug: installer-radiant-cms-sous-heroku
title: Installer Radiant CMS sous heroku
tags:
- outils
- ruby
- rubyonrails
---

[RadiantCMS](http://radiantcms.org/) est un gestionnaire de contenus simple basé sur le framework [RubyOnRails](http://rubyonrails.org/), permettant de mettre en place facilement des sites relativement complexes, notamment grâce à son langage de tags (Radius). 

RadiantCMS fonctionne très bien avec l'hébergement Heroku, avec quelques petits changements à effectuer - décrit ci-dessous.

Installation des gems nécessaires en local

	gem install radiant sqlite3 heroku taps

Création de l'application "myapp":

	mkdir myapp
	cd myapp
	radiant --database=sqlite3  .
<!--more-->  
Création de la base de donnée:

	rake db:bootstrap

Ajout du fichier Gemfile:

	source :gemcutter
	gem 'rails', '2.3.8'
	gem 'RedCloth'
	gem 'will_paginate','2.3.11'
	gem 'radiant' , '0.9.1'

Important: une modification de ```radiant-0.9.1/vendor/rails/activesupport/lib/active_support.rb``` pour ajouter ```require ‘thread’``` avant ```module ActiveSupport``` est nécessaire pour éviter une erreur du type: ```gems/radiant-0.9.1/vendor/rails/activesupport/lib/active_support/dependencies.rb:55: uninitialized constant ActiveSupport::Dependencies::Mutex (NameError)```

Lancer l'application en mode préprod puis en mode prod en visitant http://localhost:3000/admin pour créer les fichiers .js nécessaires (il n'est pas possible d'écrire dans le filesystem d'Heroku)

	./script/server
	./script/server -e production

Création du référentiel git:

	git init
	git add .

Création du fichier ```.gitignore```, contenant:

	db/*.sqlite3.db
	log
	tmp

Premier commit:

	git commit -m "First commit"

Hébergement sur heroku (pour l'instant sur ruby 1.8.7):

	heroku create myapp --stack bamboo-ree-1.8.7
	heroku db:push
	git push heroku master
