# Job 04 - Conteneur SSH avec Dockerfile

## Objectif
Utilisation d'un Dockerfile pour créer une image SSH sans utiliser une image SSH existante.

## Fichiers

### Dockerfile
```dockerfile
FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y openssh-server

RUN mkdir /var/run/sshd

RUN echo 'root:root123' | chpasswd

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
```

## Commandes utilisées

### Construire l'image
```bash
docker build -t myssh .
```

### Lancer le conteneur avec redirection de port
```bash
docker run -d -p 2222:22 --name ssh_container myssh
```

### Se connecter en SSH
```bash
ssh root@192.168.81.154 -p 2222
```

## Informations de connexion
- **Utilisateur:** root
- **Mot de passe:** root123
- **Port:** 2222
