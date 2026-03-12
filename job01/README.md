# Job 01 - Installation de Docker

## Objectif
Créer une VM Debian en mode console et installer Docker CLI.

## Spécifications de la VM
- Disque : 8 Go
- RAM : 1 Go
- vCPU : 1

## Commandes utilisées

### Mise à jour du système
```bash
sudo apt update && sudo apt upgrade -y
```

### Installation de Docker
```bash
sudo apt install ca-certificates curl gnupg -y
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo apt install docker-ce-cli -y
```

### Vérification
```bash
docker --version
```
