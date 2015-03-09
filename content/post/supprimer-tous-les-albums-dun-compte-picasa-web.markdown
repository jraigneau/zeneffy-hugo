---
date: 2010-03-01 14:18:22+00:00
slug: supprimer-tous-les-albums-dun-compte-picasa-web
title: Supprimer tous les albums d'un compte picasa web
tags:
- google
- python
- snippets
---

Un petit script pour supprimer en une seule opération tous les albums d'un compte picasa web - à utiliser avec modération !

il faut penser à installer l'[API Google Picasa Web](http://code.google.com/intl/fr/apis/picasaweb/overview.html) pour que cela fonctionne.


	#!/usr/bin/python2.5
	# -*- coding: utf-8 -*-

	import gdata.photos.service
	import gdata.media
	import gdata.geo

	#http://code.google.com/intl/fr/apis/picasaweb/developers_guide_protocol.html

	def get_albums():
	      email = "xx@gmail.com"
	      pwd = "xxpwd"
	      gd_client = gdata.photos.service.PhotosService()
	      gd_client.email = email   # Set your Picasaweb e-mail address...
	      gd_client.password = pwd  # ... and password
	      gd_client.source = 'api-sample-google-com'
	      gd_client.ProgrammaticLogin()

	      albums = gd_client.GetUserFeed()
	      for album in albums.entry: #on parse les albums dispo sur le compte
	        print "suppression de " + album.title.text
	        gd_client.Delete(album)

	##Début script
	if __name__ == '__main__':
	    get_albums()
