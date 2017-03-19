FROM multiarch/alpine:aarch64-v3.5

MAINTAINER https://github.com/larmog

COPY .work/minio-arm64 /usr/bin/minio
COPY config-minio.json /app/config/config.json

VOLUME ["/export"]

EXPOSE 9000
ENTRYPOINT ["minio", "-C", "/app/config"]

CMD ["version"]
