---
date: 2011-02-13 19:20:45+00:00
slug: veilleur-une-application-de-surveillance-des-sites-web
title: 'Veilleur: une application de surveillance des sites web'
tags:
- google
- java
- ruby
- projets
---

Abonné depuis plusieurs mois à plusieurs services de monitoring de sites web (notamment [pingdom](http://www.pingdom.com)), j'ai décidé de me faire mon propre service en profitant de l'architecture de [Google App Engine](http://code.google.com/intl/fr-FR/appengine/).

Bien évidemment, l'application est en Ruby avec le framework [Sinatra](http://www.sinatrarb.com) et se base sur [appengine-jruby](http://code.google.com/p/appengine-jruby/), qui permet d'utiliser Ruby via [JRuby](http://jruby.org/) (Implémentation de Ruby en Java).
<!--more-->
En utilisant Google App Engine, je m'affranchis de la gestion de l'authentification (comptes google), de la base de donnée et surtout je peux utiliser un système [CRON](http://fr.wikipedia.org/wiki/Cron) intégré dans le service Google. Ce système me permet de lancer automatiquement et périodiquement les tests d'URL pour me donner le temps d'accès et calculer la disponibilité du site web.

Après une petite semaine de travail, le premier résultat est très intéressant et peut-être utilisé par tous sur [veilleur.zeneffy.fr](http://veilleur.zeneffy.fr)

Le projet en lui même est géré via [GitHub](https://github.com/jraigneau/veilleur) + [Lighthouse](http://zeneffy.lighthouseapp.com/projects/69787-veilleur/overview) (tous les détails sur [labs.zeneffy.fr](http://labs.zeneffy.fr/projets/veilleur/))
