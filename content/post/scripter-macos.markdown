---
date: 2011-03-11 17:10:17+00:00
slug: scripter-macos
title: Scripter MacOS
tags:
- macOS
- outils
- python
---

Dans ma très récente période Ubuntu/Linux, j'avais rédigé un petit script en python qui vérifiait régulièrement la présence de nouveaux fichiers dans un répertoire FTP - ce script étant basé sur GTK, il était nécessaire de le changer pour notamment utiliser [Growl](http://growl.info/), le système de notification disponible dans MacOS.

Ainsi le code en python donne
<!--more-->  
	#!/usr/bin/python
	# -*- coding: utf8 -*-
	"""
	Vérifie si du nouveau contenu a été rajouté sur le FTP
	"""
	import ftplib
	import os,sys
	import Growl

	try:
	    session = ftplib.FTP('xxServeur','xxLogin','xxMdP') # On se connecte au serveur
	    fileList = [] # La liste des fichiers sera dedans
	    session.retrlines('LIST',fileList.append)
	    session.quit() #On se déconnecte
	    for txt in fileList:
	        if txt.find(".DS_Store") > -1: #macOS a parfois de drole de spécificité
	            fileList.remove(txt)
	    if len(fileList) == 0:
	        print "Vide"
	    else: 
	        gn = Growl.GrowlNotifier( "CheckMyFTP", ["Nouveau contenu"] )
	        gn.register()
	        image = Growl.Image.imageFromPath(os.path.join(os.path.dirname(__file__), "kfind.png"))
	        gn.notify( "Nouveau contenu", "Nouveau contenu disponible", "Un nouveau contenu a été ajouté sur le FTP de papa",icon=image )
	except:
	    print "Impossible de se connecter"

Puis, il s'agit de faire jouer ce script régulièrement (toutes les heures par exemple). Dans le cas de MacOS 10.5+, il faut utiliser launchd à la place de crontab: dans le répertoire ````$HOME/Library/LaunchAgents``, il suffit alors de créer un fichier fr.zeneffy.checkftp.plist qui contiendra:

	<?xml version="1.0" encoding="UTF-8"?>
	<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
	<plist version="1.0">
	<dict>
	        <key>label</key>
	        <string>fr.zeneffy.checkftp.plist</string>

	        <key>ProgramArguments</key>
	        <array>
	                <string>/Users/julien/Code/scripts/CheckMyFTP/CheckMyFTP.py</string>
	        </array>

	        <key>Nice</key>
	        <integer>1</integer>

	        <key>StartInterval</key>
	        <integer>3600</integer>

	        <key>StandardErrorPath</key>
	        <string>/tmp/checkftp.err</string>

	        <key>StandardOutPath</key>
	        <string>/tmp/checkftp.out</string>
	</dict>
	</plist>

puis de charger ce fichier de configuration

	launchctl load fr.zeneffy.checkftp.plist

et voilà, toutes les heures CheckMyFTP.py sera lancé et il m'affichera une notification en cas de nouveaux fichiers disponibles sur le répertoire FTP.

Ressources: http://www.devdaily.com/mac-os-x/mac-osx-startup-crontab-launchd-jobs
