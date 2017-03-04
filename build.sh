#!/bin/bash

QEMU_VERSION=v2.8.0

if [ ! -f qemu-aarch64-static ]; then
  echo "downloading qemu ..."
  wget -q https://github.com/multiarch/qemu-user-static/releases/download/$QEMU_VERSION/qemu-aarch64-static
  chmod a+x qemu-aarch64-static
  echo "qemu $QEMU_VERSION done"
fi

if [ ! -f minio ]; then
  echo "downloading minio ..."
  wget -q minio https://dl.minio.io/server/minio/release/linux-arm64/minio
  chmod a+x minio
  echo "minio done"
fi

if [ ! -f mc ]; then
  echo "downloading mc ..."
  wget -q https://dl.minio.io/client/mc/release/linux-arm64/mc
  chmod a+x mc
  echo "mc done"
fi

echo "building minio server ..."
docker build -t thenatureofsoftware/minio-arm64:latest -f Dockerfile.minio .

echo "building minio client ..."
docker build -t thenatureofsoftware/mc-arm64:latest -f Dockerfile.mc .

echo "building minio mirror ..."
docker build -t thenatureofsoftware/mc-mirror-arm64:latest -f Dockerfile.mc-mirror .
