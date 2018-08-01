# Certbot Dockerfile

---

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
