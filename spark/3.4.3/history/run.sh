#!/bin/bash

# shellcheck disable=SC1091

set -o errexit
set -o nounset
set -o pipefail
# set -o xtrace # Uncomment this line for debugging purposes

# Load libraries
. /opt/scripts/libs/libos.sh
. /opt/scripts/libs/liblog.sh

# Load JournalNode environment variables
. /opt/scripts/spark/3.4.3/history/env.sh

START_COMMAND=("${SPARK_HOME}/bin/spark-class" "org.apache.spark.deploy.history.HistoryServer")

info() {
  echo "$(date +'%Y-%m-%d %H:%M:%S') INFO: $@"
}

info "** Starting Spark History Server **"

if am_i_root; then
    exec_as_user "$SPARK_DAEMON_USER" "${START_COMMAND[@]}"
else
    exec "${START_COMMAND[@]}"
fi