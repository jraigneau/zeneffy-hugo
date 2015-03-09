---
date: 2008-05-19 19:41:51+00:00
slug: checkmyftp
title: CheckMyFTP
tags:
- projets
- python
- snippets
---

Ce script simple vérifie s'il y a du contenu sur un site FTP et dans ce cas affiche une image. Ce script est le préambule à [Photo2Web](http://blog.zeneffy.fr/2008/05/photo2web/) avec GUI et utilisation de ftplib.

	#!/usr/bin/python
	# -*- coding: utf8 -*-
	"""
	Vérifie si du nouveau contenu a été rajouté sur le FTP
	"""
	import ftplib
	import pygtk,gtk
	pygtk.require('2.0')
	import os,sys

	try:
	    session = ftplib.FTP('XXX','XXX','XXX') # On se connecte au serveur
	    fileList = [] # La liste des fichiers sera dedans
	    session.retrlines('LIST',fileList.append)
	    session.quit() # On se déconnecte
	    if fileList == []:
	        print "Vide"
	    else:
	        window = gtk.Window()
	        window.set_title('CheckMyFTP')
	        image = gtk.Image()
	        image.set_from_file(os.path.join(sys.path[0], 'contenu.jpg'))
	        window.connect('delete-event', gtk.main_quit)
	        window.add(image)
	        window.set_position(gtk.WIN_POS_CENTER)
	        window.show_all()
	        gtk.main()
	except:
	    print "Impossible de se connecter"