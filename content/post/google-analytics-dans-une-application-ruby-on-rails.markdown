---
date: 2010-10-21 13:48:55+00:00
slug: google-analytics-dans-une-application-ruby-on-rails
title: Google Analytics dans une application Ruby On Rails
tags:
- google
- ruby
- rubyonrails
- projets
---

Dans le cadre de l'application [vauban](http://labs.zeneffy.fr/projets/vauban/) développée via le framework [RubyOnRails](http://rubyonrails.org/), j'ai été amené à intégrer [Google Analytics](http://www.google.com/analytics/) en 3 étapes très simples:

Créer le compte dans Google Analytics pour obtenir un code javascript du type

		<script type="text/javascript">

		  var _gaq = _gaq || [];
		  _gaq.push(['_setAccount', 'UA-12194039-4']);
		  _gaq.push(['_trackPageview']);

		  (function() {
		    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
		    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
		    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
		  })();

		</script>

Créer un "partial" dans ```app/views/layouts_ appelé __ga.html.rb``` et y copier le javascript

Insérer le code dans la balise ```<head>``` du fichier ```app/view/layouts/application.html.erb``` (pour l'avoir sur tout le site - à modifier éventuellement)

	 	<%= render :partial => "layouts/ga" if Rails.env.production? %>

A noter que la condition ```if Rails.env.production``` permet de n'afficher le code que lorsque l'application est en production, ceci afin de ne pas pertuber les statistiques lors du développement.

et voilà, [Ruby On Rail](http://rubyonrails.org)s a encore une fois démontré sa simplicité!

[Source](http://aihuiong.com/post/452550136/google-analytics-and-rails-in-3-steps-and-less-than-5)
