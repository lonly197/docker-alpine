# docker-alpine

> This is a custom Alpine Dcoker Image that contains some basic packages.

![Logo](https://raw.githubusercontent.com/docker-library/docs/781049d54b1bd9b26d7e8ad384a92f7e0dcb0894/alpine/logo.png)

## Introduction

> Please use corresponding branches from this repo to play with code.

- __3.6__
- __3.6-cn__
- __3.6-slim__
- __3.6-slim-cn__

## Usage

Use like you would any other base image:

```docker
FROM lonly/docker-alpine:3.6
RUN apk add --no-cache mysql-client
ENTRYPOINT ["mysql"]
```

This example has a virtual image size of only 36.5MB. Compare that to our good friend Ubuntu:

```docker
FROM ubuntu:16.04
RUN apt-get update \
    && apt-get install -y --no-install-recommends mysql-client \
    && rm -rf /var/lib/apt/lists/*
ENTRYPOINT ["mysql"]
```
This yields us a virtual image size of about 184MB image.

## Documentation

This image is well documented. [Check out the documentation at Viewdocs](http://gliderlabs.viewdocs.io/docker-alpine).

## License

![License](https://img.shields.io/github/license/lonly197/docker-alpine.svg)

## Contact me

- Email: <lonly197@qq.com>