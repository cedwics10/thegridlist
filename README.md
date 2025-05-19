# thegridlist
Dynamic async CLI

How to start the project ? (command lines)

0. Ouvrir Docker

1. Ouvrir powerhsell à la racine du projet

2.Ouvrir le bon fichier de configuration 

notepad $PROFILE

3. Ajouter le contenu suivant dans le fichier ouvert

function startlist {
    docker compose up --build
}

4. Enregistrer et fermer le fichier

5. Redémarrer Powershell

4. Lancer les commandes suivantes dans Powershell 

. $PROFILE
startlist

5. En cas de problème de configuration

Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

Routine :
startlist


Requirements :
- Docker