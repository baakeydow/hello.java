#!/usr/bin/env bash
sudo docker run \
-p 3306/tcp \
-p 80:8080 \
-v /var/lib/mysql/app:/run/mysqld \
-v $PWD/app:/usr/src/app \
-it hello-java-app /bin/bash