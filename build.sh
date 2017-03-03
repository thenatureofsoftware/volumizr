#!/bin/bash

QEMU_VERSION=v2.8.0

if [ ! -f qemu-aarch64-static ]; then
  echo "downloading qemu ..."
  wget -q https://github.com/multiarch/qemu-user-static/releases/download/$QEMU_VERSION/qemu-aarch64-static
  chmod a+x qemu-aarch64-static
  cp qemu-aarch64-static server
  cp qemu-aarch64-static mc
  echo "qemu done"
fi

if [ ! -f ./server/minio ]; then
  echo "downloading minio ..."
  wget -q -O ./server/minio https://dl.minio.io/server/minio/release/linux-arm64/minio
  chmod a+x ./server/minio
  echo "minio done"
fi

if [ ! -f ./mc/mc ]; then
  echo "downloading mc ..."
  wget -q -O ./mc/mc https://dl.minio.io/client/mc/release/linux-arm64/mc
  chmod a+x ./mc/mc
  echo "mc done"
fi

echo "building minio server ..."
docker build -t thenatureofsoftware/minio-arm64:latest ./server

echo "building minio client ..."
docker build -t thenatureofsoftware/mc-arm64:latest ./mc

echo "building minio mirror ..."
docker build -t thenatureofsoftware/mirror-arm64:latest ./mirror
