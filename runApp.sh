#!/usr/bin/env bash
sudo docker build -t hello-java-app .
sudo docker run -it -p 80:8080 --rm --name runningJava hello-java-app
