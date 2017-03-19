FROM multiarch/alpine:armhf-v3.5

MAINTAINER https://github.com/larmog

COPY .work/mc-arm /usr/bin/mc

COPY config-mc.json /app/config/config.json

VOLUME /app/config

ENTRYPOINT ["mc", "--quiet", "-C", "/app/config"]
