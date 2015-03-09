---
date: 2011-02-05 13:31:25+00:00
slug: creer-une-nouvelle-application-sous-heroku
title: Créer une nouvelle application sous heroku
tags:
- outils
- snippets
---

**Aide-Mémoire**: Pour créer rapidement une nouvelle application sur heroku

	git init
	git add .
	git commit -m "nouvelle application"
	heroku create nomapplication
	git push heroku master
	heroku addons:add newrelic:bronze
<!--more-->
