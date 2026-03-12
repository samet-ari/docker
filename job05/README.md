# Job 05 - Alias Docker

## Objectif
Créer des alias pour les commandes Docker dans ~/.bashrc.

## Alias ajoutés dans ~/.bashrc
```bash
# Alias Docker

# Commandes images
alias di='sudo docker images'
alias dpu='sudo docker pull'
alias drmi='sudo docker rmi'
alias db='sudo docker build -t'

# Commandes conteneurs
alias dps='sudo docker ps'
alias dpsa='sudo docker ps -a'
alias dr='sudo docker run'
alias drd='sudo docker run -d'
alias dst='sudo docker stop'
alias drm='sudo docker rm'
alias dl='sudo docker logs'
alias dex='sudo docker exec -it'

# Nettoyage
alias dclean='sudo docker system prune -f'
```

## Appliquer les changements
```bash
source ~/.bashrc
```

## Test
```bash
dps    # Lister les conteneurs actifs
dpsa   # Lister tous les conteneurs
di     # Lister les images
```
