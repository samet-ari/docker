# Job 09 - Registry local Docker

## Objectif
Créer et utiliser un registry local et ajouter une interface web pour le gérer.

## Fichiers

### docker-compose.yml
```yaml
services:
  registry:
    image: registry:2
    ports:
      - "5000:5000"
    volumes:
      - registry_data:/var/lib/registry

  ui:
    image: joxit/docker-registry-ui:latest
    ports:
      - "8082:80"
    environment:
      - SINGLE_REGISTRY=true
      - REGISTRY_TITLE=Mon Registry Local
      - NGINX_PROXY_PASS_URL=http://registry:5000
    depends_on:
      - registry

volumes:
  registry_data:
```

## Commandes utilisées

### Lancer le registry
```bash
docker compose up -d
```

### Taguer et envoyer une image vers le registry
```bash
docker tag mynginx localhost:5000/mynginx
docker push localhost:5000/mynginx
```

### Vérifier les images dans le registry
```bash
curl http://localhost:5000/v2/_catalog
```

## Accès
- **Registry:** http://192.168.81.154:5000
- **Interface web:** http://192.168.81.154:8082
