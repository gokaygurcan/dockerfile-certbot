# gokaygurcan/dockerfile-certbot

FROM gokaygurcan/ubuntu:latest

LABEL maintainer="Gökay Gürcan <docker@gokaygurcan.com>"

ENV DEBIAN_FRONTEND="noninteractive"

USER root

VOLUME /etc/letsencrypt

RUN apt-get update -q && \
    apt-get install -yq --no-install-recommends software-properties-common && \
    add-apt-repository ppa:certbot/certbot && \
    apt-get update -q && \
    apt-get install -yq --no-install-recommends certbot && \
    apt-get autoclean -yqq && \
    apt-get autoremove -yqq && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /var/tmp/*

WORKDIR /usr/bin

EXPOSE 80/tcp 443/tcp

USER ubuntu
