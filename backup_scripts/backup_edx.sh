#!/usr/bin/env bash
CONTAINER_IP=$(docker inspect --format {{.NetworkSettings.IPAddress}} $1)
ssh -T -i insecure_key root@$CONTAINER_IP << EOF
  rm -rf mongo.backup
  mongodump -d edxapp --out mongo.backup/
  mongodump -d cs_comments_service_development --out mongo.backup/
  tar -zvcf edx_mongo.tar.gz mongo.backup
  mysqldump --opt edxapp | gzip -c -9 > edx_mysql.gz
EOF
scp -i insecure_key root@$CONTAINER_IP:edx_\* .