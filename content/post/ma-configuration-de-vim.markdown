---
date: 2010-03-21 18:11:55+00:00
slug: ma-configuration-de-vim
title: Ma configuration de Vim
tags:
- outils
- vim
---

Quelques liens utiles

	
  * [python-and-vim-make-your-own-ide]( http://dancingpenguinsoflight.com/2009/02/python-and-vim-make-your-own-ide/)

	
  * [code-navigation-completion-snippets-in-vim](http://dancingpenguinsoflight.com/2009/02/code-navigation-completion-snippets-in-vim/)

	
  * [light-at-the-end-of-the-carpal-tunnel-snippets-in-vim-with-snipmate](http://dancingpenguinsoflight.com/2009/07/light-at-the-end-of-the-carpal-tunnel-snippets-in-vim-with-snipmate/)

	
  * [rails-on-vim-in-english]( http://akitaonrails.com/2009/01/04/rails-on-vim-in-english)

	
  * [vim.runpaint.org/toc](http://vim.runpaint.org/toc/)

	
  * [FuzzyFinder](http://weblog.jamisbuck.org/2008/10/10/coming-home-to-vim) (utiliser 2.16!!)





Quelques raccourcis à connaître:

	python_fn.vim
	"   ]t      -- Jump to beginning of block
	"   ]e      -- Jump to end of block
	"   ]v      -- Select (Visual Line Mode) block
	"   ]<      -- Shift block to left
	"   ]>      -- Shift block to right
	"   ]#      -- Comment selection
	"   ]u      -- Uncomment selection
	"   ]c      -- Select current/previous class
	"   ]d      -- Select current/previous function
	"   ]<up>   -- Jump to previous line with the same/lower indentation
	"   ]<down> -- Jump to next line with the same/lower indentation

	python.vim
	Execute file being edited with <Shift> + e
	: Pyflakes
	: Pylint

	pydiction.vim
	C-n      -- Code completion
	C-S-n   -- reverse direction

	Mettre/enlever les numéros de ligne
	<F2>

	Navigation dans les modules
	<F4>

	Arbre
	:NERDTree
	:nmap <F9> NERDTree

	Utiliser des Onglets
	:tabnew nomDuFichier
	Ctrl-PageUp/PageDown: cycler dans les fichiers ouverts

	Copy/paste sans soucis
	:set paste
	insert
	:set paste!

	Visual blocks
	ctrl+v pour passer en visuel
	shift+i pour passer en insertion faire la modif puis ctrl+c

	Using viewports
	:sp will split the Vim window horizontally. Can be written out entirely as :split .
	:vsp will split the Vim window vertically. Can be written out as :vsplit .
	Ctrl-w Ctrl-w moves between Vim viewports.
	Ctrl-w j moves one viewport down.
	Ctrl-w k moves one viewport up.
	Ctrl-w h moves one viewport to the left.
	Ctrl-w l moves one viewport to the right.
	Ctrl-w = tells Vim to resize viewports to be of equal size.
	Ctrl-w - reduce active viewport by one line.
	Ctrl-w + increase active viewport by one line.
	Ctrl-w q will close the active window.
	Ctrl-w r will rotate windows to the right.
	Ctrl-w R will rotate windows to the left.

Dépôt de ma configuration Vim (avec autocomplétion, navigateur de fichier, snippets...) sur [gitHub](http://github.com/jraigneau/vim-conf)
