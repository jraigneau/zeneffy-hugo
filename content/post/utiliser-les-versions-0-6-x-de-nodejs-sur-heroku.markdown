---
date: 2012-01-22 15:41:38+00:00
slug: utiliser-les-versions-0-6-x-de-nodejs-sur-heroku
title: Utiliser les versions 0.6.x de Nodejs sur Heroku
tags:
- outils
- node.js
---

L'hébergeur [heroku](http://heroku.com) permet de mettre en place des applications [nodejs](http://nodejs.org/) depuis l'année dernière, toutefois par défaut la version est la 0.4.7 - version stable mais qui est devenue obsolète avec l'apparition des versions 0.6.x.

Heureusement, il est possible très facilement de forcer la version - pour cela il suffit d'une part de rajouter un "buildpack" dans les variables d'environnement de votre application:

	heroku config:add BUILDPACK_URL=https://github.com/heroku/heroku-buildpack-nodejs.git#versions

<!--more-->	
puis de modifier le fichier _packages.json_ pour rajouter une entrée "engines":


	{
	    "name": "monAppli"
	  , "version": "0.1.0"
	  , "private": true
	  , "dependencies": {
	      "express": "2.5.6"
	    , "jade": "0.20.0"
	  },
	  "engines": {
	    "node": "0.6.x",
	    "npm": "1.0.x"
	  }
	}


Puis les classiques

	git add .
	git commit -m "passage en en 0.6"
	git push heroku master

Normalement vous devriez voir les lignes:


	-----> Heroku receiving push
	-----> Fetching custom buildpack... done
	-----> Node.js app detected
	-----> Resolving engine versions
	       Using Node.js version: 0.6.8
	       Using npm version: 1.0.106
	-----> Fetching Node.js binaries


Et voilà, votre application tourne en 0.6.
