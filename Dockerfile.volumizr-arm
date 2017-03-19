FROM multiarch/alpine:armhf-v3.5

MAINTAINER https://github.com/larmog

ENV HOME=/app

COPY .work/mc-arm /usr/bin/mc
COPY volumizr.sh /app/volumizr
COPY config-mc.json /app/config/config.json

RUN apk --no-cache add bash \
  && mkdir /app/source \
  && mkdir /app/target

VOLUME /source
VOLUME /target
VOLUME /app/config

ENTRYPOINT ["/app/volumizr"]

CMD ["in", "/app/source", "/app/target"]
