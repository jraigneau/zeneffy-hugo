---
date: 2011-06-19 06:54:20+00:00
slug: npm-le-gestionnaire-de-package-de-node-js
title: npm, le gestionnaire de package de node.js
tags:
- node.js
---

Je suis en train de me documenter et de tester [node.js](http://nodejs.org), un framework pour construire des applications réseaux (type serveur web, chat...), basé d'une part sur le moteur [javascript V8](http://code.google.com/p/v8/) et conçu d'autre part pour être complètement asynchrone afin de gérer au mieux la concurrence.

node.js bien que jeune a son propre gestionnaire de package [npm](http://npmjs.org/), facile à installer et à utiliser. En bref ce qu'il faut retenir:

  * Installation de npm: ```curl http://npmjs.org/install.sh | sh```<!--more-->  
  * Installer un package en global (ne pas oublier le -g sinon le package s'installe dans le répertoire local: ```npm install -g monpackage```
  * Récupérer la liste des packages installés: ```npm ls -g```
  * Mettre à jour tous les packages: ```npm update```

Pour relier les packages dans une application node.js, il faut éditer le fichier ```package.json```:

	{
	    "name": "application-name"
	  , "version": "0.0.1"
	  , "private": true
	  , "dependencies": {
	      "express": "2.3.11"
	    , "jade": "0.12.2"
	    , "less": "1.1.2"
	    , "mongoose": "1.4.0"
	  }
	}
puis pour relier les packages au projet: ```npm link```


