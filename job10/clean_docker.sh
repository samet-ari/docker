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
