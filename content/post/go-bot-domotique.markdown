---
date: 2016-10-11T07:48:54+02:00
slug: go-bot-domotique
tags:
- projets
- go
- outils
- domotique
title: A bot to rule them all
---

> Un Anneau pour les gouverner tous
> 
> Un Anneau pour les trouver
> 
> Un Anneau pour les amener tous [...]
> 
>    -- J. R. R. Tolkien, Le seigneurs des anneaux


Pour des raisons de sécurité, j'ai décidé de n'avoir aucun accès de l'extérieur vers mes éléments de domotique, avec toutefois un inconvénient majeur: aucun moyen de consulter les diverses données ou de lancer des actions. 

Pour résoudre ce problème j'ai tenté plusieurs approches à base de tableaux de bord [dashing](http://dashing.io/) ou de solutions maison comme [proxana](https://github.com/jraigneau/proxana) mais qui ne m'ont jamais vraiment convaincues pour mon cas d'usage.

#### De l'usage d'un bot pour la domotique

Et j'ai commencé à m'intéresser aux bots de type [Hubot](https://hubot.github.com/) et à leur utilité pour finalement créer mon propre bot nommé[Goule](https://github.com/jraigneau/goule).

[Goule](https://github.com/jraigneau/goule) est un service écrit en langage Go, basé sur mon système domotique déjà en place ([InfluxDB](https://www.influxdata.com/) et [NodeRed](http://nodered.org/)) et utilisant l'infrastructure de [Telegram](https://telegram.org/) pour me permettre de lancer des actions domotiques, du type "quelle est la température chez moi?", sans risque sur la sécurité de mon système.

Une capture d'écran étant toujours plus simple que des mots, cela donne donc:
   <center><img src="https://c3.staticflickr.com/9/8268/30137861482_00e066e485.jpg" width="500" height="363" alt="graphana-elec"></center>

#### Dans les coulisses de Goule

Pour développer [Goule](https://github.com/jraigneau/goule) en langage Go (décidemment j'aime beaucoup ce langage), je me suis appuyé de façon classique sur des librairies existantes notamment [telegram-bot-api](https://gopkg.in/telegram-bot-api.v4) pour se connecter à [Telegram](https://telegram.org/) ainsi que la [librairie native pour influxdb](https://github.com/influxdata/influxdb/tree/master/client). La seule difficulté rencontrée a été le formatage des données renvoyées par influxdb, qui nécessite de fouiller un peu dans les [API](https://golang.org/pkg/encoding/json/#Number).
    
    const (
        username = "grafana"
        password = "paint"
        addr = "http://obelix:8086"
    )
    # Crée la requete et l'envoie à InfluxDB, renvoie le résultat
    func queryDB(cmd string, MyDB string) (res []client.Result, err error) {
        
        log.Printf("Connection à influxDB")
        clnt, err := client.NewHTTPClient(client.HTTPConfig{
            Addr: addr,
            Username: username,
            Password: password,
        })
        if err != nil {
            log.Fatalln("Error: ", err)
        }
        q := client.Query{
            Command:  cmd,
            Database: MyDB,
        }
        response, err := clnt.Query(q)
        if err != nil {
            log.Fatalln("Error: ", err)
        }
        if response.Error() != nil {
            log.Fatalln("Error: ", response.Error())
        }
        res = response.Results
        log.Println(response.Results)
        return res, nil
    }
    # Récupère la consommation électrique dans influxDB
    func getConsoElectrique() string {
        q := fmt.Sprintf("SELECT * FROM energy ORDER BY time DESC LIMIT 1")
        res, err := queryDB(q,"electricity")
        if err != nil {
            log.Fatal("Error: ",err)
        }
        day_energy := res[0].Series[0].Values[0][1].(json.Number).String()
        instant_energy := res[0].Series[0].Values[0][2].(json.Number).String()
        
        return fmt.Sprintf("Actuellement la consommation instantanée est de *%sW* et le cumul est de *%skW*.",instant_energy,day_energy)
    }
Le point d'attention étant sur la manipulation des résultats, avec des tableaux dans tous les sens, et des transformations JSON à faire comme pour récupérer la consommation quotidienne:  ``day_energy := res[0].Series[0].Values[0][1].(json.Number).String()`` 

#### Containers are the new black

Finalement pour faire tourner tout cela simplement (et tenter quelque chose de différent), j'ai utilisé un container [docker](https://www.docker.com/) construit directement à partir du container [Golang officiel](https://hub.docker.com/_/golang/) et en m'appuyant sur [l'article de Jérôme Petazzoni](https://blog.docker.com/2016/09/docker-golang/), avec les commandes suivantes:

    # téléchargement de l'image et des librairies + compilation de goule
    docker run golang go get -v github.com/jraigneau/goule
    # Transformation en image docker nommé goule
    docker commit $(docker ps -lq) goule
    # Lancement du programme goule dans l'image goule en mode "daemon" à partir du containter goule
    docker run --restart=always --name goule -it -d goule goule

Cela me permet d'avoir un "service" qui tourne sur ma VM principale dédiée aux containers, isolée des autres containers, avec une relance automatique en cas de problème (notamment coupure intempestive de ma ligne internet, ce qui est arrivé).

J'utilise ce système depuis un mois environ, et étant donné sa fiabilité je vais surement l'étendre à d'autres fonctions de ma domotique dans le futur.