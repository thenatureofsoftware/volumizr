FROM scratch

MAINTAINER https://github.com/larmog

COPY qemu-aarch64-static /usr/bin/qemu-aarch64-static
COPY mc /mc

COPY config-mc.json /app/config/config.json

VOLUME /app/config

ENTRYPOINT ["/mc", "--quiet", "-C", "/app/config"]
