# Job 11 - Portainer

## Objectif
Découverte de Portainer et répétition des Jobs 2 à 9
via l'interface graphique.

## Installation de Portainer

### Créer le volume
```bash
docker volume create portainer_data
```

### Lancer le conteneur Portainer
```bash
docker run -d \
  -p 9000:9000 \
  --name portainer \
  --restart=always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v portainer_data:/data \
  portainer/portainer-ce:latest
```

### Accès
http://192.168.81.154:9000

## Jobs réalisés via Portainer

### Job 02 - hello-world
Containers → Add container → Image: hello-world → Deploy

### Job 03 - Dockerfile hello-world
Images → Build a new image → Web editor → Dockerfile

### Job 04 - SSH
Images → Build a new image → Web editor → Dockerfile SSH
Containers → Add container → Port: 2223:22 → Deploy

### Job 05 - Alias
Containers → Console → Ajouter les alias dans ~/.bashrc

### Job 06 - Volumes
Volumes → Add volume → shared-vol-portainer
Containers → Add container → Mapper le volume

### Job 07 - Docker Compose
Stacks → Add stack → Web editor → docker-compose.yml

### Job 08 - nginx
Images → Build a new image → Web editor → Dockerfile nginx

### Job 09 - Registry
Stacks → Add stack → Web editor → docker-compose.yml registry

## Alternatives à Portainer
- **Yacht** → Interface légère pour Docker
- **Lazydocker** → Interface en ligne de commande
- **Dockge** → Gestion de stacks docker-compose
- **Docker Desktop** → Interface officielle Docker
