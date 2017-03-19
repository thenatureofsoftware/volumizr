FROM multiarch/alpine:aarch64-v3.5

MAINTAINER https://github.com/larmog

COPY .work/mc-arm64 /usr/bin/mc

COPY config-mc.json /app/config/config.json

VOLUME /app/config

ENTRYPOINT ["mc", "--quiet", "-C", "/app/config"]
