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

export MODULE="${MODULE:-spark-history}"
# Basic path
export SPARK_HOME_DIR="/opt/kubeemr/spark"
export SPARK_VOLUME_DIR="/spark"

# Path
export SPARK_HOME="${SPARK_HOME_DIR}/spark-3.4.3"
export SPARK_CONF_DIR="${SPARK_HOME_DIR}/conf"
#export SPARK_DATA_DIR="${SPARK_VOLUME_DIR}/metadata"

# Bin path
export PATH=$PATH:$SPARK_HOME/bin
export PATH=$PATH:$SPARK_HOME/sbin

# System users (when running with a privileged user)
export SPARK_DAEMON_USER="hadoop"
export SPARK_DAEMON_GROUP="hadoop"

# Hadoop environment
export HADOOP_HOME_DIR="/opt/kubeemr/hadoop"
export HADOOP_HOME="${HADOOP_HOME_DIR}/hadoop-3.3.4"
export HADOOP_CONF_DIR="${HADOOP_HOME_DIR}/conf"
export HADOOP_LOG_DIR="${HADOOP_HOME_DIR}/logs"

export DEBUG_MODEL="${DEBUG_MODEL:-true}"