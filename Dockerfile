# gokaygurcan/dockerfile-certbot

FROM gokaygurcan/ubuntu:latest

LABEL maintainer="Gökay Gürcan <docker@gokaygurcan.com>"

ENV DEBIAN_FRONTEND="noninteractive"

USER root

RUN set -ex && \
    ln -fs /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime && \
    add-apt-repository ppa:certbot/certbot && \
    apt-get update -qq && \
    apt-get upgrade -yqq && \
    apt-get install -yqq --no-install-recommends --no-install-suggests \
    certbot \
    python3-certbot-dns-digitalocean \
    python3-pip && \
    apt-get autoclean -yqq && \
    apt-get autoremove -yqq && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /var/tmp/*

WORKDIR /usr/bin

VOLUME [ "/etc/letsencrypt" ]

EXPOSE 80/tcp 443/tcp

USER ubuntu

CMD [ "certbot" ]
