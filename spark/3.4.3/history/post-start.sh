#!/bin/bash

# shellcheck disable=SC1091

set -o errexit
set -o nounset
set -o pipefail
# set -o xtrace # Uncomment this line for debugging purposes

# Load libraries
. /opt/scripts/libs/libfs.sh
. /opt/scripts/libs/libos.sh
. /opt/scripts/spark/3.4.3/history/env.sh

# Ensure DataNode user and group exist when running as 'root'
if am_i_root; then
    ensure_user_exists "$SPARK_DAEMON_USER" --uid 10000 --group "$SPARK_DAEMON_GROUP"
    SPARK_OWNERSHIP_USER="$SPARK_DAEMON_USER"
else
    SPARK_OWNERSHIP_USER=""
fi

# Ensure directories used by JournalNode exist and have proper ownership and permissions
for dir in "$SPARK_HOME" "$SPARK_HOME_DIR" "$SPARK_CONF_DIR"; do
    ensure_dir_exists "$dir" "$SPARK_OWNERSHIP_USER"
done