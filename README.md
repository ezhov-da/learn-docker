- [https://spring.io/guides/gs/spring-boot/](https://spring.io/guides/gs/spring-boot/)

- [https://www.youtube.com/watch?v=QF4ZF857m44&list=WL&index=62&t=774s](https://www.youtube.com/watch?v=QF4ZF857m44&list=WL&index=62&t=774s)

- [https://hub.docker.com/](https://hub.docker.com/)

- [https://docs.docker.com/engine/reference/builder/](https://docs.docker.com/engine/reference/builder/)

```
docker build -t hello-world .

docker ps

docker ps -a

docker run --name hello hello-world

docker ps -a -q

docker rm <name/ID> # удаление контейнера

docker rm $(docker ps -qa) # удаление всех контейнеров

docker run --name hello -d hello-world # -d работа в фоне

docker stop <name/ID>

docker run --name hello -d -rm hello-world # -rm удалить контейнер после остановки

docker run --rm --name web -p 8080:8080 web-world # -p проброс портов

docker run --rm --name web -p 8080:8080 -e TZ=Europe/Moscow web-world # -e проброс переменных среды

docker run --rm --name web -p 8080:8080 -e TZ=Europe/Moscow -v /home/ezhov_da/Repositories/git/learn-docker/text.txt:/usr/src/myapp/text.txt web-world

docker volume ls

docker volume create web

docker run --rm --name web -p 8080:8080 -e TZ=Europe/Moscow -v web:/usr/src/myapp

docker images

docker rmi $(docker images -q) # удалить все образы

docker-compose up -d

docker-compose down

docker build -t ezhovda/hw .

docker push ezhovda/hw

docker login

docker rmi $(docker images -q)

docker image inspect $image
```
