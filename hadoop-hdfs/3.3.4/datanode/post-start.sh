#!/bin/bash

# shellcheck disable=SC1091

set -o errexit
set -o nounset
set -o pipefail
# set -o xtrace # Uncomment this line for debugging purposes

# Load libraries
. /opt/scripts/libs/libfs.sh
. /opt/scripts/libs/libos.sh
. /opt/scripts/hdfs/3.3.4/datanode/env.sh

# Ensure DataNode user and group exist when running as 'root'
if am_i_root; then
    ensure_user_exists "$HADOOP_DAEMON_USER" --uid 10000 --group "$HADOOP_DAEMON_GROUP"
    HADOOP_OWNERSHIP_USER="$HADOOP_DAEMON_USER"
else
    HADOOP_OWNERSHIP_USER=""
fi

# Ensure directories used by JournalNode exist and have proper ownership and permissions
for dir in "$HADOOP_HOME_DIR" "$HADOOP_VOLUME_DIR" "$HADOOP_CONF_DIR" "$HADOOP_LOG_DIR"; do
    ensure_dir_exists "$dir" "$HADOOP_OWNERSHIP_USER"
done