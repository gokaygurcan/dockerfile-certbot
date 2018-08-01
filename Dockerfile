# gokaygurcan/dockerfile-certbot

FROM gokaygurcan/ubuntu:18.04

LABEL maintainer="Gökay Gürcan <docker@gokaygurcan.com>"

ENV DEBIAN_FRONTEND="noninteractive"

VOLUME /etc/letsencrypt
VOLUME /var/www

RUN sudo apt-get update -q && \
    sudo apt-get install -yq --no-install-recommends software-properties-common && \
    sudo add-apt-repository ppa:certbot/certbot && \
    sudo apt-get update -q && \
    sudo apt-get install -yq --no-install-recommends certbot

WORKDIR /etc/letsencrypt
