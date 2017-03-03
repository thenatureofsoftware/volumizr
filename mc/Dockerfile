FROM thenatureofsoftware/alpine-arm64:latest

COPY qemu-aarch64-static /usr/bin/qemu-aarch64-static
COPY mc /app/mc

WORKDIR /app

VOLUME ["/export"]

ENTRYPOINT ["/app/mc"]
