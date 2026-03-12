# Job 03 - Dockerfile et conteneur Hello World

## Objectif
Utilisation d'un Dockerfile pour recréer le conteneur "hello-world" depuis une image Debian minimum.

## Fichiers

### Dockerfile
```dockerfile
FROM debian:bookworm-slim
CMD ["echo", "Hello from Docker!"]
```

## Commandes utilisées

### Construire l'image
```bash
docker build -t myhello .
```

### Lancer le conteneur
```bash
docker run myhello
```

### Résultat
```
Hello from Docker!
```
