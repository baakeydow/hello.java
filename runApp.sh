#!/usr/bin/env bash
if [ -d "/var/lib/mysql/app" ];
then
  dir="/var/lib/mysql/app"
elif [ -d "/usr/local/var/mysql" ];
then
  dir="/usr/local/var/mysql"
fi
if [ ! -z $dir ];
then
  sudo docker run \
  -p 3306/tcp \
  -p 8008:8080 \
  -v $PWD/sock:/run/mysqld \
  -v dir:/app/mysql/ \
  -v $PWD/app:/usr/src/app \
  -it --rm --name runningJava hello-java-app \
  /bin/bash -c "/usr/bin/mysqld --user=root & mvn clean package && java -jar target/app-0.0.1-SNAPSHOT.jar"
else
  echo "Mysql data directory not found"
  sudo docker run \
  -p 3306/tcp \
  -p 8008:8080 \
  -v $PWD/sock:/run/mysqld \
  -v $PWD/app:/usr/src/app \
  -it --rm --name runningJava hello-java-app \
  /bin/bash -c "/usr/bin/mysqld --user=root & mvn clean package && java -jar target/app-0.0.1-SNAPSHOT.jar"
fi