# syntax=docker/dockerfile:experimental
FROM node:14-alpine

RUN apk --no-cache --virtual build-dependencies add \
    make \
    g++ \
    git \
    openssh

# Download public key for github.com
RUN mkdir -p /root/.ssh && \
    chmod 0700 /root/.ssh && \
    ssh-keyscan github.com >> /root/.ssh/known_hosts

WORKDIR /app/
RUN chown -R node $PWD

ADD ./service/package.json .

RUN --mount=type=ssh npm i
