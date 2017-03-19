FROM multiarch/alpine:armhf-v3.5

MAINTAINER https://github.com/larmog

COPY .work/minio-arm /usr/bin/minio
COPY config-minio.json /app/config/config.json

VOLUME ["/export"]

EXPOSE 9000
ENTRYPOINT ["minio", "-C", "/app/config"]

CMD ["version"]
