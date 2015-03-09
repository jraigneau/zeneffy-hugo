---
date: 2011-04-17 20:58:06+00:00
slug: environnements-de-preproduction-sous-heroku
title: Environnements de préproduction sous Heroku
tags:
- outils
---

Il est assez simple de créer des environnement de préproduction sans recopier tout le code:

Création de l'application de préproduction

	heroku create myapp-preprod --remote preprod

si l'environnement de préproduction est différent de l'environnement de production - sinon **ne pas jouer ces commandes**

	heroku config:add RACK_ENV=preprod --app myapp-preprod

Puis on déploie l'application:
	
	git push preprod master
	heroku rake db:migrate --app myapp-preprod
	heroku db:push --app myapp-preprod
<!--more-->  