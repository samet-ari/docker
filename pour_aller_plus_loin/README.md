# Pour Aller Plus Loin - Équivalent XAMPP

## Objectif
Créer l'équivalent de XAMPP avec Docker Compose :
un environnement de développement web complet.

## Architecture
```
Navigateur
    │
    ▼
nginx + PHP (port 8080)
    │
    ▼
MariaDB (base de données)
    │
    ▼
phpMyAdmin (port 8081)

FTP (port 21) → volume partagé → nginx
```

## Fichiers

### Dockerfile
```dockerfile
FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
    nginx \
    php-fpm \
    php-mysql

RUN mkdir -p /run/php

COPY nginx.conf /etc/nginx/sites-available/default

EXPOSE 80

CMD service php8.2-fpm start && nginx -g 'daemon off;'
```

### nginx.conf
```nginx
server {
    listen 80;
    root /var/www/html;
    index index.php index.html;

    location / {
        try_files $uri $uri/ =404;
    }

    location ~ \.php$ {
        include fastcgi_params;
        fastcgi_pass unix:/run/php/php8.2-fpm.sock;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    }
}
```

### docker-compose.yml
```yaml
services:
  nginx:
    build: .
    ports:
      - "8080:80"
    volumes:
      - webdata:/var/www/html
    depends_on:
      - mariadb

  mariadb:
    image: mariadb:latest
    environment:
      - MYSQL_ROOT_PASSWORD=root123
      - MYSQL_DATABASE=mydb
      - MYSQL_USER=user
      - MYSQL_PASSWORD=user123
    volumes:
      - dbdata:/var/lib/mysql

  phpmyadmin:
    image: phpmyadmin:latest
    ports:
      - "8081:80"
    environment:
      - PMA_HOST=mariadb
      - PMA_USER=user
      - PMA_PASSWORD=user123
    depends_on:
      - mariadb

  ftp:
    image: delfer/alpine-ftp-server
    ports:
      - "21:21"
      - "21000-21010:21000-21010"
    volumes:
      - webdata:/ftp/user
    environment:
      - USERS=user|Docker@2024
      - ADDRESS=192.168.81.154

volumes:
  webdata:
  dbdata:
```

## Commandes utilisées

### Lancer le système
```bash
docker compose up -d
```

### Vérifier les conteneurs
```bash
docker ps
```

### Arrêter le système
```bash
docker compose down
```

## Accès
- **nginx + PHP:** http://192.168.81.154:8080
- **phpMyAdmin:** http://192.168.81.154:8081
- **FTP:** 192.168.81.154:21 (user/Docker@2024)
