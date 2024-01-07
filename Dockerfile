# gokaygurcan/dockerfile-certbot

FROM gokaygurcan/ubuntu:latest

# metadata
LABEL maintainer "Gökay Gürcan <docker@gokaygurcan.com>"

# set up environment variables
ENV DEBIAN_FRONTEND="noninteractive" \
    LANGUAGE="en_US.UTF-8" \
    LANG="en_US.UTF-8" \
    LC_ALL="en_US.UTF-8" \
    TZ="Europe/Amsterdam" \
    USER="ubuntu"

USER root

RUN set -ex && \
    ln -fs /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime && \
    # upgrade packages
    apt-get update -qq && \
    apt-get upgrade -yqq && \
    # install packages
    apt-get install -yqq --no-install-recommends --no-install-suggests \
    certbot \
    python3-certbot-dns-cloudflare \
    python3-certbot-dns-digitalocean \
    python3-certbot-dns-dnsimple \
    python3-certbot-dns-gandi \
    python3-certbot-dns-gehirn \
    python3-certbot-dns-google \
    python3-certbot-dns-linode \
    python3-certbot-dns-ovh \
    python3-certbot-dns-rfc2136 \
    python3-certbot-dns-route53 \
    python3-certbot-dns-sakuracloud \
    python3-certbot-dns-standalone \
    python3-pip && \
    apt-get autoclean -yqq && \
    apt-get autoremove -yqq && \
    # clean up
    apt-get autoclean -yqq && \
    apt-get autoremove -yqq && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/ && \
    rm -rf /tmp/* && \
    rm -rf /var/tmp/*

WORKDIR /usr/bin

VOLUME [ "/etc/letsencrypt" ]

EXPOSE 80/tcp 443/tcp

USER ubuntu

CMD [ "certbot" ]
