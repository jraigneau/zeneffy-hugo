---
date: 2010-06-01 16:51:26+00:00
slug: lier-github-lighthouse
title: Lier Github & Lighthouse
tags:
- outils
---

Utilisant [Github](http://github.com) (comme dépôt de code) et [lighthouse](http://lighthouseapp.com/) (comme gestionnaire d'anomalies et évolutions), je viens de découvrir qu'il était très simple de lier les deux. Cela permet de faire apparaître directement dans lighthouse les changements de code et les nouvelles versions et donc de les lier facilement aux anomalies.

**Côté lighthouse:**

sur votre page de profil, il faut créer un "API token" correspondant au projet que vous souhaitez (on obtient un code du type _432f1b2c1a[...]35bb1ba1d_)

**Côté github:**

Dans la partie admin d'un de vos dépôts, il suffit de choisir "Service Hooks", puis Lighthouse et de remplir les champs demandés, en utilisant le token précédent.

Si tout a correctement fonctionné, vous verrez apparaître les dernières modifications de Github côté lighthouse.

Il suffit ensuite de tagguer les commentaires git avec [#numticket motclef:valeur] pour lier ticket et modifications de code.

exemple:

	# Fermons le ticket #1
	"correction du ticket [#1 state:resolved]"

Pratique, non?
