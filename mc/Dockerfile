FROM thenatureofsoftware/alpine-arm64:latest

COPY qemu-aarch64-static /usr/bin/qemu-aarch64-static
COPY mc /usr/local/bin/mc

VOLUME ["/export"]

ENTRYPOINT ["mc"]
