---
date: 2012-07-03 13:07:41+00:00
slug: dans-combien-de-jours
title: Dans combien de jours ?
tags:
- rubyonrails
- projets
---

Mon fils compte très souvent les jours restants avant chaque événement (Mariages, entrée au CP, Vacances…) et chaque jour demande donc _"Dans combien de jours c'est xxx"_.

Autant compter sur 2 à 3 semaines reste faisable, autant quand il s'agit de compter les jours avant un événement dans 6 mois les choses se compliquent.

Aussi en bon geek que je suis, j'ai rapidement prototypé une application sobrement intitulée [dcdj](https://github.com/jraigneau/dcdj) qui permet de rentrer un événement et d'avoir le nombre de jours restants.
<!--more-->	
L'objectif étant d'avoir toujours sous la main l'application, l'utilisation des technologies mobiles était une évidence. Une petite revue rapide d'objective-C (ainsi que le prix de la licence AppStore!) m'ayant convaincue que finalement les technologies web restaient les plus adaptées, j'ai développé [dcdj](https://github.com/jraigneau/dcdj) avec le classique [Ruby on Rails](http://rubyonrails.org) et surtout [jQuery Mobile](http://jquerymobile.com).

Retrouver Rails après quelques mois de [node.js](http://nodejs.org) a été un vrai plaisir et j'ai surtout découvert que jQuery Mobile était une librairie très intéressante à utiliser pour créer rapidement des applications web lisibles sur des mobiles et tablettes.

Le résultat peut-être testé sur [dcdj-test](http://dcdj-test.herokuapp.com/) et le code source est bien évidemment libre et disponible sur [github](https://github.com/jraigneau/dcdj).
