---
date: 2008-05-26 20:19:39+00:00
slug: photo2web
title: Photo2Web
tags:
- projets
- python
- snippets
---

Ce script écrit Python permet d'envoyer des photos extraites via [Picasa](http://picasa.google.fr/ ) sur un site FTP, le tout avec une interface graphique GTK2.

C'est mon premier développement "important" en Python - il m'a permis notamment de voir:



	
  * Interface graphique et GTK2 et utilisation de [Glade](http://daniel.coquette.free.fr/dotclear/index.php/post/2006/12/11/Creer-des-interfaces-graphique-avec-PyGTK-et-Glade).

	
  * Utilisation de la librairie [ftplib](http://docs.python.org/lib/module-ftplib.html).

	
  * [Mécanique des threads](http://faq.pygtk.org/index.py?req=show&file=faq20.006.htp) dans une IHM.


Il reste fortement améliorable, notamment en ce qui concerne la gestion des exceptions (try...except).

**Code**

	#!/usr/bin/python
	# -*- coding: utf8 -*-
	"""
	Envoie les photos de picasa vers photo.raigneau.net
	v1.0: Release Initiale
	V1.1: modification picasa,os.F_OK pour gestion fichier picasa.ini
	"""

	import os,sys,ftplib
	import pygtk
	pygtk.require("2.0")
	import gtk
	import gtk.glade
	import threading
	import time
	import gobject

	gobject.threads_init()

	class MyThread(threading.Thread):
	    """
	    Does the stuff
	    """
	    def __init__(self, progressBar,console):
	        super(MyThread, self).__init__()
	        self.progressBar = progressBar
	        self.console = console
	        self.quit = False

	    def update_progressBar(self):
	        self.progressBar.pulse()
	        return False

	    def run(self):
	        try:
	            self.writeInConsole("Ouverture de la session")
	            session = ftplib.FTP('XXX','XXX','XXX') # On se connecte au serveur
	            #Création des repertoires sur lesquelles travailler
	            gobject.idle_add(self.update_progressBar)
	            directories = os.environ.get("NAUTILUS_SCRIPT_SELECTED_FILE_PATHS").splitlines(False)
	            #directories = ["/home/tifauve/Documents/Code/Python/CheckMyFTP","/home/tifauve/Documents/Code/Python/gtk"]
	            #self.writeInConsole("Répertoires à télécharger:"+directories)
	            for dir in directories:
	                #suppression .picasa
	                picasa = os.path.join(dir, 'Picasa.ini')
	                if(os.access(picasa,os.F_OK)):
	                    self.writeInConsole("Suppression du fichier Picasa.ini dans "+dir)
	                    os.remove(picasa)
	                gobject.idle_add(self.update_progressBar)
	                self.uploadDir(session,dir)
	            self.writeInConsole("Fin des téléchargements")
	            self.progressBar.set_fraction(1.0)
	            self.writeInConsole("Vous pouvez fermer l'application")
	            session.quit() # On se déconnecte

	        except:
	            self.writeInConsole("Impossible de se connecter")
	            print "Impossible de se connecter"

	    def upload(self, ftp, dir, file):
	        """
	        Fonction pour uploader un fichier
	        """
	        try:
	            ftp.storbinary("STOR " + file, open(os.path.join(dir,file)), 1024)
	        except:
	            self.writeInConsole("Impossible d'uploader le fichier"+file)
	            print "Impossible d'uploader le fichier"+file

	    def uploadDir(self, session, dir):
	        """
	        Fonction pour uploader un repertoire
	        """
	        try:
	            self.writeInConsole("Téléchargement du répertoire: "+dir)
	            serverDir = os.path.split(dir)[1]
	            session.mkd(serverDir)
	            session.cwd(serverDir)
	            for file in os.listdir(dir):
	                self.writeInConsole("\t"+file)
	                gobject.idle_add(self.update_progressBar)
	                self.upload(session, dir, file)
	            session.cwd('..')
	        except:
	            self.writeInConsole("Impossible de traiter le répertoire "+serverDir)
	            print "Impossible de traiter le répertoire "+serverDir

	    def writeInConsole(self , text):
	        """
	        Ecrit dans la console
	        """
	        # Récupération du buffer
	        text_buffer = self.console.get_buffer()
	        end_iter = text_buffer.get_end_iter()
	        text_buffer.insert(end_iter, "\n"+text)
	        self.console.scroll_to_iter(text_buffer.get_end_iter(),0.0)

	class Photo2Web:
	    """
	    Classe principale (initialise GUI)
	    """
	    def __init__(self):
	        """
	        Initialisation
	        """
	        gladefile=os.path.join(sys.path[0],"photo2web.glade")
	        windowname="window"
	        self.widgets=gtk.glade.XML (gladefile,windowname)
	        self.autoConnect()

	    def __getitem__(self, key):
	        """
	        Permet d'accéder plus vite à un widget: self['label1'].set_text('Vous avez cliqué !')
	        """
	        return self.widgets.get_widget(key)

	    def autoConnect(self):
	        """
	        Auto-connection automatique des handlers gtk_handler dans python <=> handler dans glade
	        """
	        eventHandlers = {}
	        for (itemName,value) in self.__class__.__dict__.items():
	            if callable(value) and itemName.startswith('gtk_'):
	                eventHandlers[itemName[4:]] = getattr(self,itemName)
	        self.widgets.signal_autoconnect(eventHandlers)

	    def gtk_destroy(self, source=None, event=None):
	        gtk.main_quit()

	    def main(self):
	        t = MyThread(self['progression'],self['console'])
	        t.start()
	        gtk.main()
	        t.quit = True
	        return 0

	# we start the app like this...
	if __name__ == '__main__':
	    app = Photo2Web()
	    app.main()

et le fichier glade correspondant

	<?xml version="1.0" encoding="UTF-8" standalone="no"?>
	<!DOCTYPE glade-interface SYSTEM "glade-2.0.dtd">
	<!--*- mode: xml -*-->
	<glade-interface>
	  <widget class="GtkWindow" id="window">
	    <property name="width_request">350</property>
	    <property name="height_request">210</property>
	    <property name="visible">True</property>
	    <property name="title" translatable="yes">Photo2Web</property>
	    <property name="resizable">False</property>
	    <property name="window_position">GTK_WIN_POS_CENTER</property>
	    <property name="icon_name">gtk-network</property>
	    <signal name="delete_event" handler="destroy"/>
	    <child>
	      <widget class="GtkVBox" id="vbox1">
	        <property name="visible">True</property>
	        <child>
	          <widget class="GtkImage" id="image1">
	            <property name="height_request">20</property>
	            <property name="visible">True</property>
	            <property name="pixbuf">logoPhoto2Web.png</property>
	          </widget>
	        </child>
	        <child>
	          <widget class="GtkToolbar" id="toolbar1">
	            <property name="visible">True</property>
	            <property name="border_width">3</property>
	            <property name="toolbar_style">GTK_TOOLBAR_BOTH</property>
	            <child>
	              <widget class="GtkToolItem" id="toolitem2">
	                <property name="visible">True</property>
	                <child>
	                  <widget class="GtkLabel" id="label1">
	                    <property name="visible">True</property>
	                    <property name="label" translatable="yes">Avancement: </property>
	                  </widget>
	                </child>
	              </widget>
	              <packing>
	                <property name="expand">False</property>
	                <property name="homogeneous">False</property>
	              </packing>
	            </child>
	            <child>
	              <widget class="GtkToolItem" id="toolitem3">
	                <property name="visible">True</property>
	                <child>
	                  <widget class="GtkProgressBar" id="progression">
	                    <property name="width_request">260</property>
	                    <property name="visible">True</property>
	                    <property name="activity_mode">True</property>
	                    <property name="pulse_step">0.10000000149</property>
	                  </widget>
	                </child>
	              </widget>
	              <packing>
	                <property name="expand">False</property>
	                <property name="homogeneous">False</property>
	              </packing>
	            </child>
	            <child>
	              <widget class="GtkToolItem" id="toolitem4">
	                <property name="visible">True</property>
	                <child>
	                  <widget class="GtkProgressBar" id="progressbar1">
	                    <property name="width_request">257</property>
	                    <property name="visible">True</property>
	                    <property name="pulse_step">0.10000000149</property>
	                  </widget>
	                </child>
	              </widget>
	              <packing>
	                <property name="expand">False</property>
	                <property name="homogeneous">False</property>
	              </packing>
	            </child>
	          </widget>
	          <packing>
	            <property name="expand">False</property>
	            <property name="fill">False</property>
	            <property name="position">1</property>
	          </packing>
	        </child>
	        <child>
	          <widget class="GtkScrolledWindow" id="scrolledwindow1">
	            <property name="visible">True</property>
	            <property name="can_focus">True</property>
	            <property name="shadow_type">GTK_SHADOW_IN</property>
	            <child>
	              <widget class="GtkTextView" id="console">
	                <property name="visible">True</property>
	                <property name="can_focus">True</property>
	                <property name="border_width">3</property>
	                <property name="editable">False</property>
	                <property name="cursor_visible">False</property>
	                <property name="text" translatable="yes">Photo2Web transmet vos photos avec classe!
	</property>
	              </widget>
	            </child>
	          </widget>
	          <packing>
	            <property name="position">2</property>
	          </packing>
	        </child>
	        <child>
	          <widget class="GtkLabel" id="label2">
	            <property name="height_request">1</property>
	            <property name="visible">True</property>
	            <property name="label" translatable="yes">Photo2Web - Copyright (C) Julien Raigneau</property>
	            <property name="justify">GTK_JUSTIFY_CENTER</property>
	            <property name="width_chars">0</property>
	            <property name="single_line_mode">True</property>
	          </widget>
	          <packing>
	            <property name="position">3</property>
	          </packing>
	        </child>
	      </widget>
	    </child>
	  </widget>
	</glade-interface>

**Ressources**

	
  * [http://nedbatchelder.com/code/modules/FtpUpload.py](http://nedbatchelder.com/code/modules/FtpUpload.py)

	
  * [http://effbot.org/librarybook/ftplib.htm](http://effbot.org/librarybook/ftplib.htm)

	
  * [http://mail.python.org/pipermail/python-list/2003-September/224679.html](http://mail.python.org/pipermail/python-list/2003-September/224679.html)


