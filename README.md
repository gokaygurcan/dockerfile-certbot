# Certbot/Let's Encrypt

## Additional packages

- certbot

## Volumes

| Path             | Description                                                                        |
| ---------------- | ---------------------------------------------------------------------------------- |
| /etc/letsencrypt | Let's Encrypt files (see [NGINX](https://github.com/gokaygurcan/dockerfile-nginx)) |

## Ports

| Port | Process | TCP/UDP |
| ---- | ------- | ------- |
| 80   | Certbot | TCP     |
| 443  | Certbot | TCP     |

## Usage

To pull the image

```bash
docker pull gokaygurcan/certbot
```

To create a new certificate

```bash
docker run -it --rm \
    --user root \
    --name certbot-example.com \
    -p 80:80 -p 443:443 \
    -v /etc/letsencrypt:/etc/letsencrypt \
    -w /usr/bin \
    gokaygurcan/certbot \
    certbot certonly \
    -vvvv \
    --agree-tos \
    --standalone \
    --http-01-port 80 \
    --tls-sni-01-port 443 \
    -d example.com \
    -m "email@example.com"
```

To renew an existing certificate(s)

```bash
docker run -it --rm \
    --user root \
    --name certbot-renew \
    -p 80:80 -p 443:443 \
    -v /etc/letsencrypt:/etc/letsencrypt \
    -w /usr/bin \
    gokaygurcan/certbot \
    certbot renew \
    --http-01-port 80 \
    --tls-sni-01-port 443
```
