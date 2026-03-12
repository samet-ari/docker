# Job 07 - Docker Compose : nginx + FTP

## Objectif
Utiliser docker-compose pour créer deux conteneurs nginx et FTP liés entre eux avec un volume commun.

## Fichiers

### docker-compose.yml
```yaml
services:
  nginx:
    image: nginx:latest
    ports:
      - "8080:80"
    volumes:
      - webdata:/usr/share/nginx/html

  ftp:
    image: delfer/alpine-ftp-server
    ports:
      - "21:21"
      - "21000-21010:21000-21010"
    volumes:
      - webdata:/ftp/user
    environment:
      - USERS=user|Docker@2024
      - ADDRESS=192.168.81.154

volumes:
  webdata:
```

## Commandes utilisées

### Lancer les conteneurs
```bash
docker compose up -d
```

### Vérifier les conteneurs
```bash
docker ps
```

### Arrêter les conteneurs
```bash
docker compose down
```

## Informations de connexion FTP
- **Hôte:** 192.168.81.154
- **Utilisateur:** user
- **Mot de passe:** Docker@2024
- **Port:** 21

## Résultat
Les fichiers uploadés via FTP sont automatiquement
accessibles depuis nginx grâce au volume partagé.
