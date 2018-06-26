#!/usr/bin/env bash
sudo docker build -t hello-world-app .
sudo docker run -it --rm --name runningWorld hello-world-app
