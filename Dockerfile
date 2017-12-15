FROM alpine:3.6

ARG VERSION=3.6-slim-cn
ARG BUILD_DATE
ARG VCS_REF

LABEL \
    maintainer="lonly197@qq.com" \
    org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.docker.dockerfile="/Dockerfile" \
    org.label-schema.license="Apache License 2.0" \
    org.label-schema.name="lonly/docker-alpine" \
    org.label-schema.url="https://github.com/lonly197" \
    org.label-schema.description="This is a custom Alpine Dcoker Image that contains the python2 and oracle jdk environment, as well as some basic packages." \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.vcs-url="https://github.com/lonly197/docker-apline" \
    org.label-schema.vcs-type="Git" \
    org.label-schema.vendor="lonly197@qq.com" \
    org.label-schema.version=$VERSION \
    org.label-schema.schema-version="1.0"

# Define environment
## Ensure local python is preferred over distribution python   
ENV	PATH=/usr/local/bin:$PATH \
    ## http://bugs.python.org/issue19846
    ## > At the moment, setting "LANG=C" on a Linux system *fundamentally breaks Python 3*, and that's not OK.
    LANG=C.UTF-8

# Install base packages
RUN	set -x \
    ## Add alpine repo
    && echo http://mirrors.aliyun.com/alpine/v3.6/main/ >> /etc/apk/repositories \
    && echo http://mirrors.aliyun.com/alpine/v3.6/community/ >> /etc/apk/repositories \
    ## Update apk package
    && apk update \
    ## Add base package
    && apk add --no-cache --upgrade --virtual=build-dependencies bash curl ca-certificates wget tzdata tar unzip \
    ## Update ca-cert
    && update-ca-certificates \
    ## Define timezone
    && cp -r -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    ## Update kernel header files
    && apk add --no-cache --upgrade linux-headers \
    && echo -ne "Alpine Linux ${VERSION} image. (`uname -rsv`)\n" >> /root/.built \
    ## Cleanup
    # && apk del build-dependencies \
    && rm -rf *.tgz *.tar *.zip \
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/*