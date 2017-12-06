# docker-alpine

> This is a custom Alpine Dcoker Image that contains the python2 and oracle jdk environment, as well as some basic packages.

## Build

```bash
docker build --build-arg VCS_REF=`git rev-parse --short HEAD` \
--build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
--rm \
-t lonly/docker-alpine:3.6-slim .
```
