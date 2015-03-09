---
date: 2011-04-14 14:34:01+00:00
slug: extensions-radiant-sur-heroku-via-les-sous-modules-git
title: Extensions Radiant sur Heroku via les sous-modules Git
tags:
- outils
- bash
---

Heroku ne supportant pas les sous-modules git, il convient d'être vigilant en utilisant les extensions radiant : en effet tout fonctionnera en local mais les données des extensions dans /vendor ne seront pas poussées sur heroku - d'où des erreurs.

Tout d'abord pour vérifier l'existence de sous module:

	find . -mindepth 2 -name .git

Si il y a une réponse, il faut modifier cela:

	cd myapp
	$ rm -rf `find . -mindepth 2 -name .git`
	$ git rm --cache `git submodule | cut -f2 -d' '`
	$ git rm .gitmodules
	$ git add .
	$ git config -l | grep '^submodule' | cut -d'=' -f1 | xargs -n1 git config --unset-all
	$ git commit -m "récupération des sousmodules git"

source: http://stackoverflow.com/questions/894647/radiant-extensions-on-heroku
<!--more-->  