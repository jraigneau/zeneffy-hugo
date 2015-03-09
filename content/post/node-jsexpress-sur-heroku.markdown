---
date: 2011-06-27 20:30:26+00:00
slug: node-jsexpress-sur-heroku
title: Node.js/Express sur heroku
tags:
- outils
- node.js
---

Je suis en train de tester [node.js](http://nodejs.org/) ces derniers jours, et notamment le [framework web Express](http://expressjs.com/) - Fan de l'hébergeur [Heroku](http://www.heroku.com/), d'autant plus depuis qu'il est possible d'avoir des applications [node.js](http://blog.heroku.com/archives/2011/5/31/celadon_cedar/) (entre autres), j'ai souhaité installer une application de test en suivant [ce tutorial](http://pcoding.blogspot.com/2011/06/hebergement-nodejs-avec-heroku-celadon.html) - et tout n'a pas fonctionné du premier coup :(

En effet, pour créer mon squelette d'application "zen-hw", j'ai utilisé la commande

	[julien.newton: zen-hw]$ express
qui crée par défaut une arborescence d'application Express - or par défaut le fichier app.js lancera la webapp via la commande
<!--more-->
	app.listen(3000);
qui fonctionne parfaitement en local (sauf si [pow](http://pow.cx/) est installé, mais c'est une autre histoire) mais pas sur heroku, avec un beau crash de l'application visible via:

	[julien.newton: zen-hw]$ heroku ps
	Process       State               Command
	------------  ------------------  ------------------------------
	web.1         crashed for 8s      node app.js 

Pour éviter ce point, il suffit de modifier app.js pour chaque application Express créée via la commande ```_express_``` pour utiliser ```_process.env.PORT_```, ce qui donne à la fin du fichier:

	var port = process.env.PORT || 3210;
	app.listen(port, function(){
	  console.log("Listening on " + port);
	});

et voilà l'application fonctionne sous heroku !
