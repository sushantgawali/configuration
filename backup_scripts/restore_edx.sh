#!/usr/bin/env bash
CONTAINER_IP=$(docker inspect --format {{.NetworkSettings.IPAddress}} $1)
scp -i insecure_key edx_* root@$CONTAINER_IP:
ssh -T -i insecure_key root@$CONTAINER_IP << EOF
  tar xzvf edx_mongo.tar.gz
  mongorestore --db edxapp mongo.backup/edxapp
  gunzip edx_mysql.gz
  mysqladmin -f drop edxapp
  mysqladmin -f create edxapp
  mysql -D edxapp < edx_mysql
  source /edx/app/edxapp/edxapp_env
  /edx/bin/manage.edxapp lms migrate --settings=docker --delete-ghost-migrations
  /edx/bin/supervisorctl restart edxapp:
EOF
