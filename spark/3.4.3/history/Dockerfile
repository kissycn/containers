FROM docker.io/dtweave/minideb-java8:bookworm

ARG TARGETARCH

LABEL org.opencontainers.image.base.name="docker.io/dtweave/spark-history:v3.4.3" \
      org.opencontainers.image.licenses="Apache-2.0" \
      org.opencontainers.image.ref.name="3.4.3-debian-12" \
      org.opencontainers.image.title="spark-history" \
      org.opencontainers.image.version="3.4.3"

ENV HOME="/" \
    OS_ARCH="${TARGETARCH:-amd64}" \
    OS_FLAVOUR="debian-12" \
    OS_NAME="linux"

COPY spark-3.4.3 /opt/kubeemr/spark/spark-3.4.3
COPY *.sh /opt/scripts/spark/3.4.3/history/

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get autoremove --purge -y curl && \
    apt-get update && apt-get upgrade -y && \
    apt-get clean && rm -rf /var/lib/apt/lists /var/cache/apt/archives

RUN /opt/scripts/spark/3.4.3/history/setup.sh

ENV APP_VERSION="3.4.3" \
    APP_NAME="spark-history" \
    SPARK_HOME="/opt/kubeemr/spark/spark-3.4.3" \
    HADOOP_HOME="/opt/kubeemr/hadoop/hadoop-3.3.4" \
    PATH=$PATH:$SPARK_HOME/bin \
    PATH=$PATH:$SPARK_HOME/sbin

EXPOSE 9083

ENTRYPOINT [ "/opt/scripts/spark/3.4.3/history/entrypoint.sh" ]
CMD [ "/opt/scripts/spark/3.4.3/history/run.sh" ]