---
date: 2011-02-25 22:47:37+00:00
slug: google-app-engine-une-emi-deception
title: 'Google App Engine: une demie déception'
tags:
- google
- outils
- projets
---

Dans le cadre de ma petite application de surveillance de site web, [veilleur](/2011/02/veilleur-une-application-de-surveillance-des-sites-web/), j'ai [utilisé l'infrastructure Google App Engine](/2011/02/veilleur-une-application-de-surveillance-des-sites-web/) pour héberger code & base de donnée. Le résultat au bout de 2 semaines est assez peu concluant- du moins pour la version "Free":
	
  * Le système de quotas est contraignant, et atteint vite ses limites (pour moi de temps machine à cause des requêtes nécessaires pour vérifier l'état de santé des sites)<!--more-->
  * L'applicatif se lance de façon dynamique par défaut pour l'offre "free", i.e. il y a un temps d'initialisation lors des requêtes web, surtout sur un site de faible trafic comme celui ci - l'option "Always On" évitant ce problème étant payante.
  * En deux semaines d'utilisation, l'infrastructure m'a semblé peu fiable, avec des erreurs étranges non reproductible - causées manifestement par Google App Engine lui même.

Mes prochaines applications ne seront donc pas hébergées sur GAE - mais plutôt chez Heroku comme [vauban](http://vauban.heroku.com) qui reste pour moi une référence de l'hébergement Rails / Sinatra.
