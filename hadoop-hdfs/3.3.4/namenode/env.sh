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

export HADOOP_HOME_DIR="/opt/kubeemr/hadoop"
export HADOOP_VOLUME_DIR="/hadoop/dfs"
# Logging configuration
export MODULE="${MODULE:-namenode}"
# Paths
export HADOOP_HOME="${HADOOP_HOME_DIR}/hadoop-3.3.4"
export DFS_NAME_NODE_EDITS_DIR="${HADOOP_VOLUME_DIR}/metadata"
export HADOOP_CONF_DIR="${HADOOP_HOME_DIR}/conf"
export HADOOP_LOG_DIR="${HADOOP_HOME_DIR}/logs"

export PATH=$PATH:$HADOOP_HOME/bin
export PATH=$PATH:$HADOOP_HOME/sbin

# System users (when running with a privileged user)
export HADOOP_DAEMON_USER="hadoop"
export HADOOP_DAEMON_GROUP="hadoop"

export DEBUG_MODEL="${DEBUG_MODEL:-true}"