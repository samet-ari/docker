# Job 02 - Test de l'installation Docker

## Objectif
Tester l'installation de Docker avec le conteneur "hello-world" et se familiariser avec les commandes.

## Commandes utilisées

### Lancer le conteneur hello-world
```bash
docker run hello-world
```

### Commandes de base

#### Images
```bash
docker images          # Lister les images
docker pull ubuntu     # Télécharger une image
docker rmi hello-world # Supprimer une image
```

#### Conteneurs
```bash
docker ps              # Lister les conteneurs actifs
docker ps -a           # Lister tous les conteneurs
docker start <id>      # Démarrer un conteneur
docker stop <id>       # Arrêter un conteneur
docker rm <id>         # Supprimer un conteneur
```

#### Informations
```bash
docker inspect <id>    # Détails d'un conteneur
docker logs <id>       # Logs d'un conteneur
docker stats           # Utilisation des ressources
```
