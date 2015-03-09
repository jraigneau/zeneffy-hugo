---
date: 2010-03-26 15:19:22+00:00
slug: installer-redmine-sur-lighttpd
title: Installer Redmine sur lighttpd
tags:
- ruby
- rubyonrails
- ubuntu
---

J'utilise actuellement le serveur web [lighttpd](http://www.lighttpd.net/) sur mon serveur personnel, ce qui nécessite un peu de paramétrage différent de Apache. Ainsi pour faire fonctionner [Redmine](http://www.redmine.org/) (Application Ruby on Rails de gestion de projet), j'ai utilisé cette configuration:

	#Virtual host
	server.modules += ( "mod_fastcgi", "mod_rewrite")

	$HTTP["host"]  =~ "labs.zeneffy.fr" { # nom du vhos
	    server.errorlog = "/var/log/lighttpd/zeneffy/labs/error.log"
	    accesslog.filename = "/var/log/lighttpd/zeneffy/labs/access.log"
	    server.document-root = "/var/www/zeneffy/labs/public"
	    server.indexfiles = ( "dispatch.fcgi" )
	    server.error-handler-404 = "/dispatch.fcgi"
	    url.rewrite-once = (
	        "^/(.*\..+(?!html))$" => "$0",
	        "^/(.*)\.(.*)"        => "$0",
	    )

	    fastcgi.server =  (
	        ".fcgi" => (
	        "labs.tifauve.net" => (
	            "bin-path" => "/var/www/zeneffy/labs/public/dispatch.fcgi",
	            "socket" => "/tmp/redmine.socket",
	            "min-procs" => 1,
	            "max-procs" => 2,
	            "idle-timeout" => 20,
	            "check-local" => "disable",
	            "bin-environment" => ( "RAILS_ENV" => "production", "RAILS_ROOT" => "/var/www/zeneffy/labs" )
	            )
	        )
	    )

	}
	