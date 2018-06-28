FROM maven:alpine
ENV MYSQL_DATA_DIR=/var/lib/mysql \
  MYSQL_RUN_DIR=/run/mysqld \
  MYSQL_DATABASE=springbootdb \
  MYSQL_USER=springboot \
  MYSQL_PASSWORD=springboot\
  MYSQL_ROOT_PASSWORD=root
RUN apk add --update mysql mysql-client && rm -f /var/cache/apk/*
COPY app/my.cnf /etc/mysql/my.cnf
COPY app /usr/src/app
WORKDIR /usr/src/app
VOLUME ["${MYSQL_DATA_DIR}", "${MYSQL_RUN_DIR}"]
EXPOSE 3306/tcp 8080
RUN sh mysqlSetup.sh && mvn clean package
CMD ["java", "-jar", "target/app-0.0.1-SNAPSHOT.jar"]