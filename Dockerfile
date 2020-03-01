# docker build -t web-world .
# docker run --rm --name web -p 8080:8080 -e TZ=Europe/Moscow -v /home/ezhov_da/Repositories/git/learn-docker/text.txt:/usr/src/myapp/text.txt web-world

# из какого образа https://hub.docker.com/_/openjdk
FROM openjdk:8

# копировать из target в образ
COPY ./target/learn-docker-1.0-SNAPSHOT.jar /usr/src/myapp/learn-docker-1.0-SNAPSHOT.jar
COPY ./text.txt /usr/src/myapp/text.txt

# сделать директорию в образе рабочей
WORKDIR /usr/src/myapp

EXPOSE 8080

# ENV TZ Europe/Moscow # настройка временной зоны как переменной среды

CMD ["java", "-jar", "learn-docker-1.0-SNAPSHOT.jar"]