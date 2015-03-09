---
date: 2010-04-24 13:36:29+00:00
slug: migration-de-zeneffy-labs
title: Migration de Zeneffy Labs
tags:
- outils
- rubyonrails
- projets
---

Hier, j'ai migré [Zeneffy Labs](http://labs.zeneffy.fr/) de [Redmine](http://www.redmine.org/) vers le couple[ Radiant CMS](http://radiantcms.org/) / [GitHub](github.com/jraigneau). En effet Redmine était un peu trop conséquent pour mes besoins et prenait trop de ressources sur mon serveur.  Mon choix s'est alors porté d'une part sur Radiant CMS pour servir de mini wiki  et d'autre part sur GitHub pour les dépôts de code.

L'inscription et l'utilisation de GitHut sont rapides et faciles (car liées aussi intrinsèquement à la simplicité de [Git](http://git-scm.com/) - gestion de configuration décentralisée) et il m'a suffit de pousser les anciens dépôts de code vers le nouveau système.

En ce qui concerne Radiant CMS, j'ai décidé de l'héberger sur [Heroku](http://heroku.com/), hébergeur dédié Ruby (donc parfait pour Ruby on Rails, sinatra...) qui offre par ailleurs de nombreux avantages (plugins de supervision gratuit, déploiement rapide, et coût zéro pour un hébergement simple).

En moins de 3h, y compris la création du nouveau thème et le temps de jeter un oeil sur la documentation, tout était terminé - le résultat sur [Zeneffy Labs](http://labs.zeneffy.fr/) !
