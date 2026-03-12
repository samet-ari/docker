# Job 06 - Volumes Docker

## Objectif
Comprendre l'utilisation des volumes entre deux conteneurs et la gestion des volumes.

## Commandes utilisées

### Créer un volume
```bash
docker volume create shared_vol
```

### Lancer le premier conteneur et créer un fichier
```bash
docker run -it --name container1 -v shared_vol:/data debian:bookworm-slim bash
echo "Bonjour Job06!" > /data/test.txt
exit
```

### Lancer le deuxième conteneur et lire le fichier
```bash
docker run -it --name container2 -v shared_vol:/data debian:bookworm-slim bash
cat /data/test.txt
```

### Gestion des volumes
```bash
docker volume ls                       # Lister les volumes
docker volume inspect shared_vol       # Détails d'un volume
docker volume rm shared_vol            # Supprimer un volume
docker volume prune                    # Supprimer les volumes inutilisés
```

## Résultat
Le fichier créé dans container1 est accessible depuis container2
grâce au volume partagé shared_vol.
