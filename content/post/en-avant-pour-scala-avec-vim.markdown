---
date: 2011-10-02 10:31:59+00:00
slug: en-avant-pour-scala-avec-vim
title: En avant pour Scala avec Vim
tags:
- clojure
- scala
- vim
---

Après quelques années de développement avec mes deux langages favoris [Python](http://blog.zeneffy.fr/tag/python/) et de [Ruby](http://blog.zeneffy.fr/tag/ruby/), j'ai décidé de me lancer dans un nouveau langage basé sur la [JVM](http://fr.wikipedia.org/wiki/JVM_(informatique)) (donc pas de Java pur, j'ai déjà donné!). Après avoir étudié [Clojure](http://clojure.org/) et [Scala](http://www.scala-lang.org/), j'ai décidé de me concentrer sur Scala qui me semble plus naturel et qui mélange les paradigmes "Orienté-Objet" et "programmation fonctionnelle" - Clojure pour sa part est un [lisp](http://fr.wikipedia.org/wiki/Lisp) qui semble très puissant mais moins accessible pour un développeur moyen et dilettante comme moi.
<!--more-->
Mon premier réflexe a été bien évidemment de m'assurer que macVim me permettrait de facilement commencer quelques développement en Scala. En cherchant rapidement sur le web, j'ai pu trouvé quelques astuces pour la coloration, la navigation à travers les méthodes...

En premier lieu, il faut installer le plugin Scala pour vim:

	svn export --force http://lampsvn.epfl.ch/svn-repos/scala/scala-tool-support/trunk/src/vim

puis copier les fichiers obtenus dans votre répertoire .vim

Deuxième étape, l'installation du plugin [Tagbar](http://www.vim.org/scripts/script.php?script_id=3465) (téléchargement du fichier .vba puis méthode d'installation normale vim)


	vim tagbar.vba
	  :so %
	  :q

TagBar ne prenant pas en compte Scala, il faut légèrement modifier certains fichiers
Tout d'abord, création dans votre $HOME du fichier .ctags suivant

	--langdef=Scala
	--langmap=Scala:.scala
	--regex-Scala=/^[ \t]*class[ \t]*([a-zA-Z0-9_]+)/\1/c,classes/
	--regex-Scala=/^[ \t]*object[ \t]*([a-zA-Z0-9_]+)/\1/o,objects/
	--regex-Scala=/^[ \t]*trait[ \t]*([a-zA-Z0-9_]+)/\1/t,traits/
	--regex-Scala=/^[ \t]*case[ \t]*class[ \t]*([a-zA-Z0-9_]+)/\1/r,cclasses/
	--regex-Scala=/^[ \t]*abstract[ \t]*class[ \t]*([a-zA-Z0-9_]+)/\1/a,aclasses/
	--regex-Scala=/^[ \t]*def[ \t]*([a-zA-Z0-9_=]+)[ \t]*.*[:=]/\1/m,methods/
	--regex-Scala=/[ \t]*val[ \t]*([a-zA-Z0-9_]+)[ \t]*[:=]/\1/V,values/
	--regex-Scala=/[ \t]*var[ \t]*([a-zA-Z0-9_]+)[ \t]*[:=]/\1/v,variables/
	--regex-Scala=/^[ \t]*type[ \t]*([a-zA-Z0-9_]+)[ \t]*[\[<>=]/\1/T,types/
	--regex-Scala=/^[ \t]*import[ \t]*([a-zA-Z0-9_{}., \t=>]+$)/\1/i,includes/
	--regex-Scala=/^[ \t]*package[ \t]*([a-zA-Z0-9_.]+$)/\1/p,packages/

Puis on va modifier le code du plugin TagBar (à priori dans ``~/.vim/plugin/tagbar.vim``), en rajoutant les lignes suivantes


	" Scala {{{3
	let type_scala = {}
	let type_scala.ctagstype = 'Scala'
	let type_scala.kinds     = [
	  \ {'short' : 'p', 'long' : 'packages',  'fold' : 1 },
	  \ {'short' : 'V', 'long' : 'values',    'fold' : 0 },
	  \ {'short' : 'v', 'long' : 'variables', 'fold' : 0 },
	  \ {'short' : 'T', 'long' : 'types',     'fold' : 0 },
	  \ {'short' : 't', 'long' : 'traits',    'fold' : 0 },
	  \ {'short' : 'o', 'long' : 'objects',   'fold' : 0 },
	  \ {'short' : 'a', 'long' : 'aclasses',  'fold' : 0 },
	  \ {'short' : 'c', 'long' : 'classes',   'fold' : 0 },
	  \ {'short' : 'r', 'long' : 'cclasses',  'fold' : 0 },
	  \ {'short' : 'm', 'long' : 'methods',   'fold' : 0 }
	\ ]
	let type_scala.sro        = '.'
	let type_scala.kind2scope = {
	  \ 'T' : 'type',
	  \ 't' : 'trait',
	  \ 'o' : 'object',
	  \ 'a' : 'abstract class',
	  \ 'c' : 'class',
	  \ 'r' : 'case class'
	\ }
	let type_scala.scope2kind = {
	  \ 'type'           : 'T',
	  \ 'trait'          : 't',
	  \ 'object'         : 'o',
	  \ 'abstract class' : 'a',
	  \ 'class'          : 'c',
	  \ 'case class'     : 'r'
	\ }
	let s:known_types.scala = type_scala



Attention, ces lignes doivent être rajoutées dans la fonction ``_function! s:InitTypes()_``

Et voilà - Vim est prêt pour Scala !

Tiré/traduit de [latestbuild.net/scala-ctags-and-vim-tagbar ](http://latestbuild.net/scala-ctags-and-vim-tagbar)
