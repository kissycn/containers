# ==============================================================================
# 定义全局 Makefile 变量方便后面引用

.PHONY: copy
copy:
	@cp -r ./3.5/debian-11/scripts/opt/* /opt/

.PHONY: minideb
minideb:
	@docker build --tag dtweave/minideb:bullseye -f minideb/bullseye/Dockerfile minideb/bullseye

.PHONY: zookeeper
zookeeper:
	@docker build --tag dtweave/zookeeper:v3.7-1.0.0 -f zookeeper/3.7/Dockerfile zookeeper/3.7/

.PHONY: hadoop-common
hadoop-common:
	@docker build --tag dtweave/hadoop-common:v3.3.5-1.0.0 -f hadoop-common/3.3.5/hadoop-common/Dockerfile hadoop-common/3.3.5/hadoop-common/

.PHONY: hdfs-journalnode
hdfs-journalnode:
	@docker build --tag dtweave/journalnode:v3.3.5-1.0.0 -f hdfs/3.3.5/journalnode/Dockerfile hdfs/3.3.5/journalnode/

.PHONY: hdfs-namenode
hdfs-namenode:
	@docker build --tag dtweave/namenode:v3.3.5-1.0.0 -f hdfs/3.3.5/namenode/Dockerfile hdfs/3.3.5/namenode/

.PHONY: hdfs-datanode
hdfs-datanode:
	@docker build --tag dtweave/datanode:v3.3.5-1.0.0 -f hdfs/3.3.5/datanode/Dockerfile hdfs/3.3.5/datanode/

.PHONY: mysql
mysql:
	@docker build --tag dtweave/mysql:v5.7.42-1.0.0 -f mysql/5.7/Dockerfile mysql/5.7/

.PHONY: import_images
import_images:
	@k3d image import dtweave/zookeeper:v3.7-1.0.0 -c kb-playground

#import_images:
#	@k3d image import dtweave/mysql:v5.7.42-1.0.0 -c velad-cluster-default
#	@k3d image import dtweave/datanode:v3.3.5-1.0.0 -c velad-cluster-default
#	@k3d image import dtweave/namenode:v3.3.5-1.0.0 -c velad-cluster-default
#	@k3d image import dtweave/journalnode:v3.3.5-1.0.0 -c velad-cluster-default
#	@k3d image import dtweave/hadoop-common:v3.3.5-1.0.0 -c velad-cluster-default
#	@k3d image import dtweave/zookeeper:v3.7-1.0.0 -c velad-cluster-default
#	@k3d image import test:v1 -c velad-cluster-default