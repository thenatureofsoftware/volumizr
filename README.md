# minio-k8s-storage

[![Build Status](https://travis-ci.org/TheNatureOfSoftware/minio-arm64.svg?branch=master)](https://travis-ci.org/TheNatureOfSoftware/minio-arm64)


This is a simple solution for solving storage in a Kubernetes cluster. The solution uses `emptyDir` volumes in `StatefulSet` and `init-containers` for setting up volumes before start by mirroring from a `minio server`, and after start continuously mirrors changes back.

![Minio storage for your Kubernets cluster](minio-k8s-storage.png)
