---
date: 2010-05-16 12:04:00+00:00
slug: personnaliser-linstallation-de-ubuntu-10-04
title: 'Personnaliser l''installation de Ubuntu 10.04'
tags:
- ubuntu
- outils
- vim
---

Suite à la sortie de Ubuntu 10.04, je me suis décidé à l'installer en machine virtuelle ([VirtualBox](http://www.virtualbox.org/)) sur mon portable pro, tout s'est très bien passé et voici quelques tuning complémentaires:

En premier lieu, on effectue une petite mise à jour post-installation

	sudo apt-get update
	sudo apt-get upgrade

Puis j'installe mon logiciel de versionnage favori (à l'heure actuelle), i.e. [Git](http://git-scm.com/)

	sudo apt-get install git-core


Ensuite on installe l'éditeur Vim avec ma configuration (stockée sur [GitHub](http://github.com/jraigneau))

	sudo apt-get install vim gvim
	sudo apt-get install ctags
	cd ~
	git clone http://github.com/jraigneau/vim-conf.git
	mv vim-conf .vim
	ln -s .vim/.vimrc
ne pas oublier d'installer ```fuzzy_file_finder``` via ```sudo gem install fuzzy_file_finder```, une fois gem installé!

**Un peu de multimédia et d'utilitaires**

Installation du Navigateur Chromium (version open source de Chrome)

		sudo add-apt-repository ppa:chromium-daily/dev
		sudo apt-get update
		sudo apt-get install chromium-browser chromium-browser-l10n


Quelques Indispensables du Dessin, de la Vidéo, et de la Musique + [Gnome-Do](http://do.davebsd.com/)

		sudo apt-get install gimp vlc exaile gnome-do flashplugin-nonfree
		sudo apt-get install sun-java6-jdk

**Installation de Ruby On rails (Framework de développement web)**
Tout d'abord on installe ruby et de la documentation

		sudo apt-get install irb libopenssl-ruby libreadline-ruby rdoc ri ruby ruby-dev
		sudo apt-get install rubybook

Puis on installe RubyGems à partir des sources pour ne pas avoir d'incompatibilités de mises à jour entre apt-get et RubyGems (problème fréquent sur Ubuntu)

		cd /usr/local/src
		sudo wget http://production.cf.rubygems.org/rubygems/rubygems-1.3.6.tgz
		sudo tar xzvf rubygems-1.3.6.tgz
		cd rubygems-1.3.6
		sudo ruby setup.rb
		sudo update-alternatives --install /usr/bin/gem gem /usr/bin/gem1.8 1
		sudo gem update --system

dans un fichier ```~/.gemrc```, on rajoute la ligne suivante afin de ne pas avoir de compilation de rdoc à chaque installation (trop lent!)

	gem: --no-ri --no-rdoc

Enfin on peut installer rails et sqlite (je n'utilise pas mysql ni postgresql sur ma machine de dév)

	sudo gem install rails
	sudo apt-get install libsqlite3-dev sqlite3 sqlite3-doc
	sudo gem install sqlite3-ruby

En bonus, quelques gems intéressants
	
  * Cheatsheet automatiques: ```sudo gem install cheat```
  * Changement facile des hosts de la machine: ```sudo gem install ghost```
  * Partage de snippets de code: ```sudo gem install gist```
