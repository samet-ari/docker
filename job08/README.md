# Job 08 - Conteneur nginx depuis Dockerfile

## Objectif
Créer un conteneur nginx sans utiliser une image nginx existante,
en utilisant un Dockerfile depuis une image Debian minimum.

## Fichiers

### Dockerfile
```dockerfile
FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y nginx

RUN echo '<html><body><h1>Bonjour, Samet! - Job 08</h1></body></html>' > /var/www/html/index.html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
```

## Commandes utilisées

### Construire l'image
```bash
docker build -t mynginx .
```

### Lancer le conteneur
```bash
docker run -d -p 8081:80 --name nginx_container mynginx
```

### Vérifier le conteneur
```bash
docker ps
```

## Résultat
La page est accessible depuis le navigateur :
http://192.168.81.154:8081
