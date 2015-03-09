---
date: 2009-03-26 10:41:00+00:00
slug: gestion-durgence-de-lenergie
title: Gestion d'urgence de l'énergie
tags:
- backup
- python
- domotique
---

J'utilise un portable comme serveur, notamment pour diminuer consommation et bruit, mais cela a un autre avantage: la batterie du portable qui peut servir "d'onduleur" en cas de perte de courant.

J'ai donc conçu un script simple pour gérer les pertes d'énergie, et prendre le temps de lancer un arrêt propre du serveur si l'alimentation n'est toujours pas rétablie.

Dans /etc/acpi/events on crée un fichier ac_dc contenant:

	event=ac_adapter.*
	action=/home/tifauve/scripts/acpi/battery/ac_dc.py %e

et voici le script ac_dc.py appelé par le démon ACPI

	#!/usr/bin/python
	# -*- coding: utf-8 -*-

	#
	# Gère l'état de la batterie
	#

	__author__ = 'Julien Raigneau'
	VERSION = "0.4"

	import sys,os,logging
	from time import strftime,sleep
	from subprocess import Popen

	lock_file = os.path.join(sys.path[0], "battery.lock")
	fork_path = os.path.join(sys.path[0], "ac_dc.py")

	def read_capacity():
		#récupere stats battery
		infos_batterie= open("/proc/acpi/battery/BAT0/state","r").readlines()
		capacite = int(infos_batterie[4].replace("remaining capacity:","").replace("\n","").replace(" ","").replace("mAh",""))
		voltage = int(infos_batterie[5].replace("present voltage:","").replace("\n","").replace(" ","").replace("mV",""))
		logging.info("read_capacity: %s,%s" % (capacite,voltage))
		return capacite,voltage

	def send_mail(sujet,corps):
		#envoi un mail
		msg = "sendEmail -s smtp.cegetel.net -t julien@raigneau.net -q -u \"%s\" -m \"%s\" -f admin@tifauve.net" % (sujet,corps)
		p = Popen(msg, shell=True)
		logging.info("send_mail: Mail envoyé avec sujet=(%s)" % sujet)

	def on_battery(capacite):
		#actions si sur battery
		while(os.path.isfile(lock_file)):
			capacite_encours,voltage = read_capacity()
			if capacite_encours <= capacite/2:
				logging.info("on_battery: Capacité actuelle %s inférieur à la référence %s" % (capacite_encours,capacite))
				sujet = "[admin@champlain]Alerte critique: Extinction du serveur en cours"
				corps = "Toujours pas de rétablissement du courant le %s.\n/!\Extinction du serveur.\n\nCapacité restante: %s mAh\nVoltage: %s mV" % (strftime("%d/%m/%Y à %H:%M:%S"),capacite_encours,voltage)
				send_mail(sujet,corps)
				os.remove(lock_file)
				logging.info("on_battery: Extinction du serveur lancée")
				p = Popen("shutdown -P now", shell=True)
			else:
				logging.info("on_battery: Capacité actuelle %s" % capacite_encours)
				logging.info("on_battery: En sommeil pendant 2min")
				sleep(120)
		logging.info("on_battery: plus de fichier de lock: sortie de la procédure")

	def on_dc():
		#actions si sur secteur
		logging.info("on_dc: Remise sur secteur")
		if os.path.isfile(lock_file):
			logging.info("on_dc: suppression du fichier de lock")
			os.remove(lock_file)


	if __name__ == '__main__':

		logFile = os.path.join(sys.path[0],"ac_dc.log")
		logging.basicConfig(level=logging.DEBUG,
	                    format='%(asctime)s %(levelname)s %(message)s',
	                    filename=logFile)

		logging.info('main: == Démarrage des contrôles ac_dc ==')
		logging.info("main: Valeur des arguments d'entrée %s" % sys.argv)
		ac_dc_valeur = sys.argv[4]
		logging.info("main: Valeur de l'argument d'entrée %s" % ac_dc_valeur)
		capacite,voltage = read_capacity()
		logging.info("main: Etat de la batterie: %s / %s" % (capacite,voltage))

		if ac_dc_valeur == "00000000":
			#si le lock existe déjà c'est qu'on est en mode "forké" sinon il faut forker
			if (os.path.isfile(lock_file)):
			    logging.info("main: le fichier de lock existe déjà => nous sommes dans le fork")
			    corps = "Le courant a été coupé sur Champlain le %s.\nDébut de la procédure de sauvegarde.\n\nCapacité restante: %s mAh\nVoltage: %s mV" % (strftime("%d/%m/%Y à %H:%M:%S"),capacite,voltage)
			    sujet = "[admin@champlain]Alerte: perte d'énergie sur CHAMPLAIN"
			    send_mail(sujet,corps)
			    on_battery(capacite)
			else:
	       		    logging.info("main: Création du fichier de lock")
			    file = open(lock_file,"w")
			    file.write("%s" % capacite)
			    file.close()
			    logging.info("main: Fork du process pour rendre la main au démon ACPI")
			    pid = Popen([fork_path, "00000000", "00000000" ,"00000000", "00000000"]).pid
			    logging.info("main: Fork effectué dans %s - sortie" % pid)

		else:
			corps = "Le courant a été rétabli sur Champlain le %s.\nFin de la procédure de sauvegarde.\n\nCapacité restante: %s mAh\nVoltage: %s mV" % (strftime("%d/%m/%Y à %H:%M:%S"),capacite,voltage)
			sujet = "[admin@champlain]Fin d'alerte: retour de l'énergie sur CHAMPLAIN"
			send_mail(sujet,corps)
			on_dc()