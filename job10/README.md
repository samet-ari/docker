# Job 10 - Scripts Bash Docker

## Objectif
Créer deux scripts bash : un pour supprimer Docker complètement
et un pour automatiser l'installation de Docker sur Debian.

## Fichiers

### clean_docker.sh
```bash
#!/bin/bash

echo "=== Nettoyage de Docker ==="

echo "Arrêt de tous les conteneurs..."
sudo docker stop $(sudo docker ps -aq) 2>/dev/null

echo "Suppression de tous les conteneurs..."
sudo docker rm $(sudo docker ps -aq) 2>/dev/null

echo "Suppression de toutes les images..."
sudo docker rmi $(sudo docker images -q) 2>/dev/null

echo "Suppression de tous les volumes..."
sudo docker volume rm $(sudo docker volume ls -q) 2>/dev/null

echo "Suppression de tous les réseaux..."
sudo docker network prune -f 2>/dev/null

echo "Désinstallation des paquets Docker..."
sudo apt-get purge -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo apt-get autoremove -y
sudo rm -rf /var/lib/docker
sudo rm -rf /etc/docker
sudo rm -rf /etc/apt/keyrings/docker.gpg
sudo rm -rf /etc/apt/sources.list.d/docker.list

echo "=== Docker a été complètement supprimé! ==="
```

### install_docker.sh
```bash
#!/bin/bash

echo "=== Installation de Docker ==="

echo "Mise à jour du système..."
sudo apt-get update && sudo apt-get upgrade -y

echo "Installation des paquets nécessaires..."
sudo apt-get install -y ca-certificates curl gnupg

echo "Ajout de la clé GPG de Docker..."
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo "Ajout du dépôt Docker..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "Installation de Docker..."
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

echo "Démarrage de Docker..."
sudo systemctl enable docker
sudo systemctl start docker

echo "=== Installation de Docker terminée! ==="
docker --version
```

## Commandes utilisées

### Rendre les scripts exécutables
```bash
chmod +x clean_docker.sh install_docker.sh
```

### Exécuter le script de nettoyage
```bash
./clean_docker.sh
```

### Exécuter le script d'installation
```bash
./install_docker.sh
```
