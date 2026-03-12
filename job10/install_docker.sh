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
