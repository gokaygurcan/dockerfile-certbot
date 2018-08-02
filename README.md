# Certbot Dockerfile

[![Docker Build Status](https://img.shields.io/docker/build/gokaygurcan/certbot.svg?style=for-the-badge&logo=docker&colorA=22b8eb)](https://hub.docker.com/r/gokaygurcan/certbot/)

To pull the image

```bash
docker pull gokaygurcan/certbot
```

To create a new certificate

```bash
docker run -it --rm --user=0 \
    -v /etc/letsencrypt:/etc/letsencrypt \
    -v /var/www:/var/www \
    gokaygurcan/certbot /usr/bin/certbot certonly \
    --agree-tos \
    --standalone \
    -d example.com \
    -m "email@example.com"
```

To renew an existing certificate

```bash
docker run -it --rm \
    -v /etc/letsencrypt:/etc/letsencrypt \
    -v /var/www:/var/www \
    gokaygurcan/certbot /usr/bin/certbot renew
```
