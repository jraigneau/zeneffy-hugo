---
date: 2011-09-04 18:55:28+00:00
slug: macvim-command-t-et-rvm
title: MacVim, Command-T et RVM
tags:
- macOS
- vim
- outils
---

[MacVim](http://code.google.com/p/macvim/) (une forme de l'éditeur VIM adaptée à MacOS) est mon éditeur de prédilection actuellement malgré de nombreux autres essais (entre autres: [Textmate](http://macromates.com/), [Kod](http://kodapp.com/), [Sublime Text](http://www.sublimetext.com/)).

Il est très configurable et permet de rajouter de nombreuses fonctionnalités utiles: ici je vous parlerai du module [Command-T](https://wincent.com/products/command-t) qui permet de faire des recherches très fines et surtout pertinentes à travers les répertoires et fichiers d'un projet - un screencast est disponible [sur le site de l'auteur](https://s3.amazonaws.com/s3.wincent.com/command-t/screencasts/command-t-demo.mov?width=640&height=480).<!--more-->

Pour l'installer sur un mac avec RVM, il faut être vigilant sur la version de Ruby employée car MacVim ne compilant pas avec ruby 1.9.

Installation de MacVim via [homebrew](http://mxcl.github.com/homebrew/) avec ruby 1.8.7:

	rvm use system
	/usr/bin/ruby -e "$(curl -fsSL https://raw.github.com/gist/323731)"
	brew install wget macvim

Installation de CommandT à partir de vim.org:

	wget http://www.vim.org/scripts/download_script.php?src_id=15560
	mvim command-t-1.2.1.vba

Puis une fois MacVim ouvert:

	:so %

En sortant de MacVim:

	cd /$HOME/.vim/ruby/command-t
	ruby extconf.rb
	make

Et voilà normalement tout fonctionne, vous pouvez utiliser la version de ruby que vous souhaitez sans problème.
