---
date: 2010-01-26 15:21:48+00:00
slug: utiliser-le-mediacenter-de-la-9box-avec-lighttpd
title: Utiliser le mediacenter de la 9Box avec lighttpd
tags:
- domotique
---

La neufbox de SFR permet de partager des contenus multimédias du PC vers le mediacenter -[ l'application fournie par SFR](http://tv.sfr.fr/mediacenter/installation.php) pour cela est tout simplement un serveur apache reconfiguré.

Pour ma part, utilisant lighttpd sur mon serveur, j'ai utilisé la configuration suivante (sachant qu'il faut évidemment récupérer les fichiers php du "package apache SFR" par ailleurs):

	$SERVER["socket"] == "192.168.1.21:26180" {
	server.document-root = "/var/www/mediacenter/httpd/"
	server.errorlog      = "/var/log/lighttpd/mp9lhd.log"
	accesslog.filename   = "/var/log/lighttpd/mp9Access.log"
	#server.pid-file      = "/var/run/mp9lhd.pid"

	#server.port = 26180

	mimetype.assign = (
	".html" => "text/html",
	".txt" => "text/plain",
	".jpg" => "image/jpeg",
	".png" => "image/png",
	)

	index-file.names = ( "index.php", "index.html")

	#server.modules +=("mod_alias")

	alias.url = ( "/__mp9ctl_share_1/" => "/var/mediaData/" )
