GYMNOCHROMIES
==========

Gymnochromie est une application d'animation générative répondant visuellement au morceau d'Erik Satie Gymnopédie I Lent et douloureux. Chaque cercle est une note et il s'anime lorsque celle ci est jouée, en tentant de recréer la beauté minimaliste de la composition de Satie.
Ce programme a été réalisé avec Processing (génération visuelle) et PureData (pour l'analyse sonore en temps réel). C'est une expérience sur les rapports son et image.

Penser à rajouter dans le dossier ./pd/ le fichier musical (nommez le gymnopedie1.wav). Il est dans le domaine public et disponible <a href="https://upload.wikimedia.org/wikipedia/commons/9/90/Erik_Satie_-_gymnopedies_-_la_1_ere._lent_et_douloureux.ogg?uselang=fr">ici</a>. Il faudra ensuite le convertir en .wav.

Le sketch processing utilise la libraire <a href="http://www.sojamo.de/libraries/oscP5/">OscP5</a> pour la communication avec PureData.
Le patch PureData utilise la librairie <a href="http://puredata.info/downloads/timbreid">timbreID</a>.

<a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/deed.fr&#39;"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-sa/3.0/88x31.png" /></a><br /><span xmlns:dct="http://purl.org/dc/terms/" property="dct:title">Gymnochromie</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="http://hugohil.net" target="_blank"property="cc:attributionName" rel="cc:attributionURL">hugohil</a> is licensed under a <a rel="license" target="_blank" href="http://creativecommons.org/licenses/by-sa/3.0/deed.fr&#39;">Creative Commons Attribution-ShareAlike 3.0 Unported License</a>.