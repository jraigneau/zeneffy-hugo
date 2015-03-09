---
date: 2011-10-30 09:37:51+00:00
slug: demarrer-avec-play-framework-scala-et-mongodb-sur-heroku
title: Démarrer avec Play! Framework, scala et MongoDB sur Heroku
tags:
- outils
- scala
---

J'ai découvert [Play! Framework](http://www.playframework.org/) il y a quelques mois avec beaucoup d'intérêt et je me suis rendu compte qu'un module [scala](http://scala.playframework.org/) existait. Voici donc un premier petit projet qui permet à la fois d'installer Play! (1.2.3) mais aussi d'utiliser MongoDB sur Heroku en quelques étapes:

  1. Suivant votre système, [installez Play! via le zip](http://www.playframework.org/download) ou via brew: ``brew install play``
  2. Installez le support java pour Play! ``play install scala``<!--more-->
  3. Créez l'application avec le support java: ``play new maSuperDemo --with scala``
  4. Testez que tout s'est bien passé: ``play run`` puis ouvrez votre navigateur sur ``http//localhost:9000``. Normalement vous devez avoir une belle fenêtre résumant le fonctionnement de Play!. Passons maintenant au choses sérieuses.

Modifiez les dépendances du projet pour ajouter [Casbah](http://api.mongodb.org/scala/casbah/2.1.5.0/index.html), la librairie Scala permettant de manipuler [MongoDB](mongodb).

	# Application dependencies
	require:
	    - play
	    - play -> scala 0.9.1
	    - com.mongodb.casbah -> casbah_2.8.1 2.1.5-1

	repositories:
	  - scalatools:
	     type: iBiblio
	     root: http://scala-tools.org/repo-releases/
	     contains:
	       - com.mongodb.casbah -> *
	       - org.scalaj -> *
		   
Attention de bien utiliser la version 2.8.1 qui est la seule compatible avec Play! 1.2.3 à l'heure actuelle.

Forcez Play! à charger toutes les dépendances (qui seront stockées dans le répertoire /lib):
	play dependencies

Préparez l'application pour le déploiement sur heroku: pour des raisons de simplicité nous allons utiliser la base MongoDB de heroku directement (pas de base de développement...c'est mal mais c'est une démo !).
Avant toute chose, créez un fichier ``.gitignore`` contenant:

	/modules
	/tmp
	/lib

Puis la magie git habituelle

	git init
	git add .
	
et enfin la déclaration sous heroku (je ne donne pas de nom à l'application, Heroku m'en choisira un tout seul) et l'installation de l'addon mongodb (ici via mongolab mais mongoHQ ferait aussi l'affaire)

	heroku create --stack cedar
	heroku addons:add mongolab:starter
	
Point important: la commande heroku config vous permettra de récupérer l'url et le port de la base mongoDB automatiquement créée. Exemple:
	``MONGOLAB_URI => mongodb://nombase:motdepasse@urlmongolab:portmongolab/nombase``
Ces données sont à intégrer dans la prochaine étape.

Créez un nouveau controleur dans /app/controllers/Messages.scala avec le code suivant:

	package controllers;

	import play.mvc._;
	import com.mongodb.casbah.Imports._
	import scala.collection.JavaConverters._

	object Messages extends Controller {

	//Création de la connexion et authentification
	  val _mongoConn = MongoConnection("urlmongolab", portmongolab)
	  _mongoConn("nombase").authenticate("nombase","motdepasse")


	  def index = {
	    val msgs = _mongoConn("nombase")("test_data").find( "msg" $exists true $ne "" )
	    val msgStrings = msgs.map( (obj: DBObject) => obj.getOrElse("msg","") )
	    Template( 'msgStrings -> msgStrings.asJava )
	  }

	  def save(msg:String) = {
	    val doc = MongoDBObject("msg" -> msg)
	    _mongoConn("nombase")("test_data").save( doc )
	    Redirect("/")
	  }
	}
Vous noterez les transformations des méthodes ".asJava" qui permettent à Groovy (le langage de scripting intégré dans Play) de gérer les listes typique de Scala.

Ajoutez une vue pour gérer le controleur avec un fichier dans /app/views/Messages/index.html

	<form action="@{Messages.save()}" method="POST"/>
	  <input type="text" name="msg"/>
	  <input type="submit" value="Add message" />
	</form>

	<ul>
	  #{list items:msgStrings, as:'mess' }
	  <li>${ mess }</li>
	  #{/list}
	</ul>

Modifiez les routes dans /config/routes

	# Routes
	# This file defines all application routes (Higher priority routes first)
	# ~~~~

	# Home page
	GET     /                                       Messages.index
	POST    /                                       Messages.save


	# Ignore favicon requests
	GET     /favicon.ico                            404

	# Map static resources from the /app/public folder to the /public path
	GET     /public/                                staticDir:public

	# Catch all
	*       /{controller}/{action}                  {controller}.{action}

Testez votre application en lançant la commande play run - normalement vous devriez être capable d'enregistrer des petites messages et de les voir apparaître à l'écran.

Déployez votre application sur heroku et admirez la !

	git add .
	git commit -m "Premier commit"
	git push heroku master
	heroku open

Ce petit tutoriel peut (doit) être complété avec le [tutoriel officiel disponible sur le site de Play](http://scala.playframework.org/documentation/scala-0.9.1/home), en attendant vous pourrez jouer avec mon application sur [http://glowing-fog-2793.herokuapp.com/](http://glowing-fog-2793.herokuapp.com/).

Tutoriel basé en partie sur [http://jaredrosoff.com/2011/05/getting-started-with-play-framework-scala-and-casbah/](http://jaredrosoff.com/2011/05/getting-started-with-play-framework-scala-and-casbah/)
