# django + mysql local development using docker

The objectives:

- start a local dev environment of django
- docker volumes are mounted to local folders so all changes take effect immediately
- MySQL port are binded locally for easier development
- commit code with migration, requirements
- teammate pull the respository
- and they have the exact same environment

## Getting Started

### Install docker

[https://docs.docker.com/engine/getstarted/step_one/#step-1-get-docker](https://docs.docker.com/engine/getstarted/step_one/#step-1-get-docker)

### Pull this res and setup env

```
$ cd django-docker-mysql
$ virtualenv -p /usr/bin/python2.7 venv
$ source venv/bin/activate
$ pip install -r django/requirements.txt
```

### Start the docker

```
$ docker-compose -f docker/dev/docker-compose.yml up
```

### Django

Browse your site in
http://127.0.0.1:8000/

Start development code in django/ folder

### MySQL

Connect to the MySQL through 127.0.0.1:3307  
username: root  
password: password

The data are stored in docker/dev/volumes/db

## Stack
- Python 2.7
- Django 1.8.17
- MySQL 5.7

## Commands

### Re-build the docker images

```
$ docker-compose -f docker/dev/docker-compose.yml build --no-cache
```

### Connect to the running django container

First, list and find out the container name

```
$ docker ps -a
```

Then connect to it

```
$ docker exec -it <container_name> bash
```

e.g.

```
$ docker exec -it django_dev_1 bash
```

### Running the container as daemon

```
docker-compose -f docker/dev/docker-compose.yml up -d
```
