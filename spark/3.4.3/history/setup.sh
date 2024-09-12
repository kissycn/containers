#!/bin/bash

# shellcheck disable=SC1091

set -o errexit
set -o nounset
set -o pipefail
# set -o xtrace # Uncomment this line for debugging purposes

# Load libraries
. /opt/scripts/libs/libfs.sh
. /opt/scripts/libs/libos.sh

# Load ZooKeeper environment variables
. /opt/scripts/spark/3.4.3/history/env.sh

ensure_user_exists "$SPARK_DAEMON_USER" --uid 10000 --group "$SPARK_DAEMON_GROUP"

# Ensure directories used by ZooKeeper exist and have proper ownership and permissions
for dir in "$SPARK_HOME" "$SPARK_HOME_DIR" "$SPARK_CONF_DIR"; do
    ensure_dir_exists "$dir"
done

chown -R "$SPARK_DAEMON_USER":"$SPARK_DAEMON_GROUP" $SPARK_HOME
chown -R "$SPARK_DAEMON_USER":"$SPARK_DAEMON_GROUP" $SPARK_CONF_DIR