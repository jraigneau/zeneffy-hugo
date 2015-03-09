---
date: 2010-06-06 06:28:49+00:00
slug: optimisation-des-os-avec-un-disque-ssd
title: Optimisation des OS avec un disque SSD
tags:
- ubuntu
- hardware
- windows
---

Ayant acheté dernièrement un disque dur SSD pour mon portable, il a fallu chercher quelques informations complémentaires pour m'assurer de la meilleur optimisation possible:

**Sous Windows Vista**
[www.ocztechnologyforum.com/forum/showthread.php?47212-Vista-32-64-SSD-Windows-Registry-tweaks](http://www.ocztechnologyforum.com/forum/showthread.php?47212-Vista-32-64-SSD-Windows-Registry-tweaks)

En bref:



	
  * Désactiver superfetch & prefetch

	
  * Activer ```clearPageFilesAtShutdown``` et ```LargeSystemCache```

	
  * Amélioration du cache disque NTFS

	
  * Suppression indexation automatique + hibernation (pour gagner de l'espace)


**Optimisations sous Linux:**
[itezer.com/blog/ubuntu-linux/125-Four-Tweaks-for-Using-Linux-with-SSD.html](http://itezer.com/blog/ubuntu-linux/125-Four-Tweaks-for-Using-Linux-with-SSD.html)
[www.zdnet.com/blog/perlow/geek-sheet-a-tweakers-guide-to-solid-state-drives-ssds-and-linux/9190](http://www.zdnet.com/blog/perlow/geek-sheet-a-tweakers-guide-to-solid-state-drives-ssds-and-linux/9190)

En synthèse:
	
  * S'assurer d'être en noatime

	
  * Utiliser la mémoire vive comme /tmp

	
  * Changer le scheduler disque (prendre noop)


Résultat:


	julien@einstein:~$ sudo hdparm -t /dev/sda
	/dev/sda:
	Timing buffered disk reads:  454 MB in  3.01 seconds = 150.66 MB/sec
