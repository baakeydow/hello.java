#!/usr/bin/env bash
sudo docker run \
-p 3306/tcp \
-p 80:8080 \
-v /var/lib/mysql/app:/run/mysqld \
-v $PWD/app:/usr/src/app \
-it --rm --name runningJava hello-java-app \
/bin/bash -c "/usr/bin/mysqld --user=root & mvn clean package && java -jar target/app-0.0.1-SNAPSHOT.jar"