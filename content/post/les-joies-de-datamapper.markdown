---
date: 2011-04-24 18:55:40+00:00
slug: les-joies-de-datamapper
title: Les joies de datamapper
tags:
- bdd
- ruby
- sinatra
---

[Datamapper](http://datamapper.org/) est un ORM ([Object Relational Mapper](http://en.wikipedia.org/wiki/Object-relational_mapping)) écrit en ruby et permettant de lier facilement Ruby à n'importe quelle base de données (mysql, postgresql...).

Grand fan de du framework web [Sinatra](http://www.sinatrarb.com/), j'utilise souvent datamapper...et je tombe souvent dans ses pièges:
	
  1. Etre vigilant sur les relations 1-n ou n-n et sur l'utilisation des objets pour éviter de charger en mémoire des centaines de données inutiles (cela m'est arrivé sur Veilleur, voir le [post correspondant](/post/rtfm).
  2. Vérifier systématiquement que les données sont bien sauvegardées: par défaut (c'est à dire sans l'option ```#DataMapper::Model.raise_on_save_failure = true```), aucun message ne prévient de l'erreur	
  3. Mettre en place un système de pour récupérer les erreurs envoyées par Datamapper via notamment: ```xx.errors.inspect```

Ces quelques points simples permettent de gagner beaucoup de temps!
<!--more-->  