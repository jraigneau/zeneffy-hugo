---
date: 2011-10-15 08:21:18+00:00
slug: scala-sur-heroku
title: Scala sur Heroku
tags:
- outils
- scala
- sinatra
---

En plein apprentissage de scala, j'ai décidé de m'intéresser au framework web [Scalatra](http://www.scalatra.org/) qui ressemble à [Sinatra](http://www.sinatrarb.com/), mon environnement favori en Ruby. Evidemment, je souhaite pouvoir partager rapidement mes 'créations' en les hébergeant sur la plate-forme [Heroku](http://www.heroku.com/), devenue [polyglotte](http://blog.heroku.com/archives/2011/8/3/polyglot_platform/) depuis quelques semaines en supportant d'autres langages que Ruby (notamment node.js, Java, Clojure, Scala et Python).
<!--more-->
Après quelques recherches sur internet, j'ai trouvé mon bonheur sur github [ici](https://gist.github.com/1209277) et [là](https://github.com/mikkelbd/scalatra-hello-heroku). Pour gagner du temps dans mes futurs projets, j'ai alors transformé ces informations en un template [giter8](https://github.com/n8han/giter8). Giter8 est un simple outil basé sur scala et [SBT](https://github.com/harrah/xsbt/wiki) qui installe des templates stockés sur Github.

Une fois [g8](https://github.com/n8han/giter8) et le [gem heroku](http://devcenter.heroku.com/articles/git) installés, mettre en ligne un projet scalatra devient alors très simple:


	g8 jraigneau/scalatra-sbt-heroku.g8
	cd monProjet
	git init
	git add . (conseil: pensez à mettre les répertoires de compilation (target) dans votre fichier .gitignore avant...)
	git commit -m "Premier commit"
	heroku create monProjet --stack cedar
	git push heroku master
	heroku open


Et voilà, votre navigateur s'ouvre sur la nouvelle application !

