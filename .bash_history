exit
sudo apt update && sudo apt upgrade -y
su -
su-
su -
exit
sudo apt update
sudo apt install ca-certificates curl gnupg -y
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install docker-ce-cli -y
docker --version
sudo apt install docker-ce -y
sudo systemctl status docker
sudo docker run hello-world
sudo docker images
sudo docker ps
sudo docker ps -a
sudo docker stats
sudo docker inspect
docker ps -a
sudo docker ps -a
sudo docker inspect 71e650cc5c2b
sudo docker logs 71e650cc5c2b
mkdir job03
ls
cd job03/
nano Docker
nano Dockerfile
sudo docker build -t myhello .
nano Dockerfile 
sudo docker build -t myhello .
sudo docker run myhello
su -
su -
ls
cd job03/
ls
cat Dockerfile 
nano Dockerfile 
sudo docker run myhello
cd ~ && mkdir job04 && cd job04
nano Dockerfile
sudo docker build -t myssh .
sudo docker run -d -p 2222:22 --name ssh_container myssh
ssh root@192.168.81.154 -p 2222
apt update
sudo apt update 
nano ~/.bashrc
source ~/.bashrc
dps
dpsa
di
cd
sudo docker volume create myvol
sudo docker run -v /host/klasor:/container/klasor ...
sudo docker volume create shared_vol
sudo docker run -it --name container1 -v shared_vol:/data debian:bookworm-slim bash
sudo docker run -it --name container2 -v shared_vol:/data debian:bookworm-slim bash
sudo docker volume ls
sudo docker volume inspect shared_vol
sudo cat /var/lib/docker/volumes/shared_vol/_data/test.txt
cd ~ && mkdir job07 && cd job07
nano docker-compose.yml
sudo apt install docker-compose-plugin -y
sudo docker compose up -d
sudo docker ps
nano docker-compose.yml
sudo docker compose down
sudo docker compose up -d
sudo docker exec job07-nginx-1 ls /usr/share/nginx/html
sudo docker compose restart nginx
sudo docker exec job07-nginx-1 ls /usr/share/nginx/html
sudo docker compose restart nginx
sudo docker ps -a
nano docker-compose.yml
sudo docker compose down
sudo docker compose up -d
sudo docker ps
nano docker-compose.yml
sudo docker compose down
sudo docker compose up -d
sudo docker ps
sudo docker ps -a
sudo docker logs job07-ftp-1
nano docker-compose.yml
sudo docker compose down
sudo docker compose up -d
dp
sudo docker ps
exit
cd ~ && mkdir job08 && cd job08
nano Dockerfile
sudo docker build -t mynginx .
sudo docker run -d -p 8081:80 --name nginx_container mynginx
cd
mkdir job09 && cd job09
nano docker-compose.yml
sudo docker compose up -d
sudo docker ps
ls
