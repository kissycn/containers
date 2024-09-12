#!/bin/bash

# shellcheck disable=SC1091

set -o errexit
set -o nounset
set -o pipefail
# set -o xtrace # Uncomment this line for debugging purposes

# Load libraries
. /opt/scripts/libs/liblog.sh
. /opt/scripts/libs/lib.sh

# Load environment variables
. /opt/scripts/spark/3.4.3/history/env.sh

print_welcome_page

if [[ $DEBUG_MODEL == true ]]; then
  info ************** env-start **************
  env
  info ************** env-end **************
  info ************** conf-start **************
  cat $SPARK_CONF_DIR/spark-defaults.conf
  info ************** conf-start **************
fi

if [[ "$*" = *"/opt/scripts/spark/3.4.3/history/run.sh"* || "$*" = *"/run.sh"* ]]; then
    info "** Starting HMS setup **"
    /opt/scripts/spark/3.4.3/history/post-start.sh
    info "** HMS setup finished! **"
fi

echo ""
exec "$@"