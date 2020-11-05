- [https://spring.io/guides/gs/spring-boot/](https://spring.io/guides/gs/spring-boot/)

- [https://www.youtube.com/watch?v=QF4ZF857m44&list=WL&index=62&t=774s](https://www.youtube.com/watch?v=QF4ZF857m44&list=WL&index=62&t=774s)

- [https://hub.docker.com/](https://hub.docker.com/)

- [https://docs.docker.com/engine/reference/builder/](https://docs.docker.com/engine/reference/builder/)


## Запуск образа

```
docker run --name hello hello-world
docker run --name hello -d hello-world # -d работа в фоне
docker run --name hello -d -rm hello-world # -rm удалить контейнер после остановки
docker run --rm --name web -p 8080:8080 web-world # -p проброс портов
docker run --rm --name web -p 8080:8080 -e TZ=Europe/Moscow web-world # -e проброс переменных среды
docker run --rm --name web -p 8080:8080 -e TZ=Europe/Moscow -v /home/ezhov_da/Repositories/git/learn-docker/text.txt:/usr/src/myapp/text.txt web-world
docker run --rm --name web -p 8080:8080 -e TZ=Europe/Moscow -v web:/usr/src/myapp
docker run -it $image sh
```

## Получение информации

```
docker history $image # набор уровней формирующих образ
docker image inspect $image 
docker inspect $container
docker inspect --format {{.NetworkSettings.IPAddress}} $container # вывод информации с использованием шаблонов Go
docker diff $container # список файлов изменённых в работающем контейнере
docker logs $container # список всех событий внутри контейнера
```

## Просмотр, остановка, удаление образов и контейнеров

### Просмотр

```
docker images # просмотр образов

docker ps # просмотр контейнеров
docker ps -a
docker ps -a -q
```

### Остановка

```
docker stop $containerNameOrID
docker stop $(docker ps -qa) # остановка всех контейнеров
```

### Удаление

```
docker rm $containerNameOrID # удаление контейнера
docker rm -v $(docker ps -qa -f status=exited) # удаление всех остановленных контейнеров

docker rmi $(docker images -q) # удалить все образы
docker rmi $(docker images --format "{{.ID}}") # удалить все образы
```

## Dockerfile

[https://docs.docker.com/engine/reference/builder/](https://docs.docker.com/engine/reference/builder/)

При выполнении команды ```COPY``` для копирования полностью иерархии необходимо использовать ```COPY files/ /files/``` вместо ```COPY files/* /files/```

```
docker build -t hello-world . # точка - это контекст, который передаётся docker демону
```

## .dockerignore

```
.git
*/.git
*/*.git
*.sw?
```

## Связывание контейнеров

```
docker run --name myredis -d redis
docker run --rm -it --link myredis:redis redis /bin/bash # --link myredis:redis - означает, что необходимо установить соединение с контейнером myredis и host должен называться redis

> redis-cli -h redis -p 6379
> ping
> set "abc" 123
> get "abc"
> exit
```

## Тома (volumes)

```
docker run --rm -v /data -it busybox sh
docker run -d -v /host/dir:/container/dir -it busybox sh
docker volume ls # просмотр доступных томов
docker volume create web
```

## Копирование из docker образа

```
docker cp $container:$containerPathToFile $pathToHost
```

## Разное

```
docker build -t hello-world .
docker-compose up -d
docker-compose down
docker build -t ezhovda/hw .
docker push ezhovda/hw
docker login
```
