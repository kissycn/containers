#!/bin/bash
#
# Environment configuration for zookeeper

# The values for all environment variables will be set in the below order of precedence
# 1. Custom environment variables defined below after Bitnami defaults
# 2. Constants defined in this file (environment variables with no default), i.e. BITNAMI_ROOT_DIR
# 3. Environment variables overridden via external files using *_FILE variables (see below)
# 4. Environment variables set externally (i.e. current Bash context/Dockerfile/userdata)

# Load logging library
# shellcheck disable=SC1090,SC1091
. /opt/scripts/libs/liblog.sh

export MODULE="${MODULE:-hivemetastore}"
# Basic path
export HIVE_HOME_DIR="/opt/kubeemr/hive"
export HIVE_VOLUME_DIR="/hive"

# Path
export HIVE_HOME="${HIVE_HOME_DIR}/hive-3.1.3"
export HIVE_CONF_DIR="${HIVE_HOME_DIR}/conf"
export HIVE_DATA_DIR="${HIVE_VOLUME_DIR}/metadata"

# Bin path
export PATH=$PATH:$HIVE_HOME/bin
export PATH=$PATH:$HIVE_HOME/sbin

# System users (when running with a privileged user)
export HIVE_DAEMON_USER="hadoop"
export HIVE_DAEMON_GROUP="hadoop"

# Hadoop environment
export HADOOP_HOME_DIR="/opt/kubeemr/hadoop"
export HADOOP_HOME="${HADOOP_HOME_DIR}/hadoop-3.3.4"
export HADOOP_CONF_DIR="${HADOOP_HOME_DIR}/conf"
export HADOOP_LOG_DIR="${HADOOP_HOME_DIR}/logs"

# Metastore database connection params
export DB_TYPE="${DB_TYPE:-mysql}"
# export DB_HOST="${DB_HOST:-localhost}"
# export DB_PORT="${DB_PORT:-3306}"
# export DB_USER="${DB_USER:-root}"
# export DB_PASSWORD="${DB_PASSWORD:-}"
# export METASTORE_DB="${METASTORE_DB:-metastore}"
# export DB_URL="jdbc:${DB_TYPE}://${DB_HOST}:${DB_PORT}/${METASTORE_DB}?createDatabaseIfNotExist=true"

export DEBUG_MODEL="${DEBUG_MODEL:-true}"