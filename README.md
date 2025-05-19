# thegridlist
Dynamic async CLI

How to start the project ? (command lines)

1. Lancer Docker

2. Ouvrir powerhsell à la racine du projet

3.Ouvrir le bon fichier de configuration 

notepad $PROFILE

4. Ajouter le contenu suivant dans le fichier ouvert

function startlist {
    docker compose up --build
}

5. Enregistrer et fermer le fichier

6. Redémarrer Powershell

7. Lancer les commandes suivantes dans Powershell 

    . $PROFILE
    startlist


# En cas de problème de configuration

Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

Routine :
startlist

Requirements :
- Docker
