---
date: 2010-07-15 18:31:06+00:00
slug: adieu-darwin
title: Adieu darwin...version Geek!
tags:
- mono
- ubuntu
---

N'étant pas particulièrement fan de certaines applications intégrées dans Ubuntu par défaut, j'ai tendance à vite les enlever post-installation.

Ici des applications mono pas très utile:

	apt-get purge f-spot gbrainy tomboy

et surtout le gros gourmand evolution:

	sudo apt-get purge evolution evolution-common evolution-couchdb evolution-exchange evolution-indicator evolution-plugins evolution-webcal libegroupwise1.2-13 libexchange-storage1.2-3
