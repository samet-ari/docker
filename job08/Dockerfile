FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y nginx

RUN echo '<html><body><h1>Bonjour, Samet! - Job 08</h1></body></html>' > /var/www/html/index.html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
