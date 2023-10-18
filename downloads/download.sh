#!/bin/bash

export DOWNLOAD_URL=https://downloads.bitnami.com/files/stacksmith/
export OS_ARCH=amd64

 COMPONENTS=( \
      "yq-4.32.2-0-linux-${OS_ARCH}-debian-11" \
      "gosu-1.16.0-3-linux-${OS_ARCH}-debian-11" \
      "java-1.8.362-4-linux-${OS_ARCH}-debian-11" \
      "zookeeper-3.7.1-164-linux-${OS_ARCH}-debian-11" \
    ) && \
    for COMPONENT in "${COMPONENTS[@]}"; do \
      if [ ! -f "${COMPONENT}.tar.gz" ]; then \
        curl -SsLf "${DOWNLOAD_URL}/files/stacksmith/${COMPONENT}.tar.gz" -O; \
        curl -SsLf "${DOWNLOAD_URL}/files/stacksmith/${COMPONENT}.tar.gz.sha256" -O; \
      fi
    done