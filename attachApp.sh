#!/usr/bin/env bash
sudo docker run \
-p 80:8080 \
-v $PWD/app:/usr/src/app \
-it hello-java-app /bin/bash -c "mvn clean package && java -jar target/app-0.0.1-SNAPSHOT.jar"