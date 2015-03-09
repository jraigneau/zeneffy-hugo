---
date: 2010-12-19 10:26:48+00:00
slug: ubuntu-installation-mineffy
title: 'Ubuntu: Installation "mineffy"'
tags:
- ubuntu
- snippets
---

Un petit pense-bête sur le **min**imum à réinstaller avant d'être **eff**icace avec une nouvelle version d'ubuntu
	
  * Installer[ Chromium](http://doc.ubuntu-fr.org/chromium-browser), le navigateur web:

		sudo apt-get install chromium-browser chromium-browser-l10n chromium-codecs-ffmpeg chromium-codecs-ffmpeg-nonfree

et installer extensions: [Gmail](https://chrome.google.com/extensions/detail/lnejbeiilmbliffhdepeobjemekgdnok) et [Delici.ous](https://chrome.google.com/extensions/detail/lnejbeiilmbliffhdepeobjemekgdnok)
	
  * Installer le nécessaire pour [Ruby et Ruby On Rails via RVM](http://doc.ubuntu-fr.org/rubyonrails#installation_complete_de_ruby_192_et_rails_30_via_rvm_maverick_meerkat)

		sudo apt-get install curl git-core build-essential zlib1g-dev libssl-dev libreadline6-dev
		sudo bash < <( curl -L http://bit.ly/rvm-install-system-wide )
		sudo adduser julien rvm
		sudo rvm install 1.9.2
		sudo rvm --default ruby-1.9.2

puis modifier ```.bashrc```

	  commenter [ -z "$PS1" ] && return
	  ajouter if [[ -n "$PS1" ]]; then
	  indenter toutes les lignes jusqu'à la fin
	  ajouter fi
	  ajouter [[ -s "/usr/local/lib/rvm" ]] && . "/usr/local/lib/rvm"

Installer Rails et autres gem utiles:

	sudo rvm gem install rails
	sudo rvm gem install redcar heroku vagrant cheat
	
  * Utilitaires à ajouter ou à enlever

		sudo apt-get install gnome-do gimp terminator
		sudo apt-get install vim ctags vim-doc vim-scripts
		sudo apt-get install desktopnova
		sudo apt-get purge f-spot gbrainy tomboy evolution evolution-common evolution-couchdb evolution-exchange evolution-indicator evolution-plugins evolution-webcal libegroupwise1.2-13
		sudo add-apt-repository ppa:tiheum/equinox
		sudo apt-get update && sudo apt-get install faenza-icon-theme


	
  * l'obligatoire [DropBox](http://www.dropbox.com/downloading?os=lnx) pour synchroniser mes fichiers entre PC

	
  * Les clés ssh

	
  * Ajout des montages NFS

		installer autofs: sudo apt-get install autofs

	dans /etc/auto.master
		
		/media/partages /etc/auto.types --ghost,--timeout=30

	dans /etc/auto.types
	
		Documents -fstype=nfs,rw 192.168.1.21:/volume1/documents
		Musique -fstype=nfs,rw 192.168.1.21:/volume1/music
		Photos -fstype=nfs,rw 192.168.1.21:/volume1/photo
		Videos -fstype=nfs,rw 192.168.1.21:/volume1/video
