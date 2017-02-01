# Google App Engine Standard ENV
FROM python:2.7-alpine

# Let Python outputs everything 
ENV PYTHONUNBUFFERED 1

# Set the file maintainer (your name - the file's author)
MAINTAINER Francis Mak <francis@franfran.com>

# Set env variables used in this Dockerfile (add a unique prefix, such as DOCKYARD)
# Local directory with project source
ENV DOCKYARD_SRC=django
# Directory in container for all project files
ENV DOCKYARD_SRVHOME=/srv
# Directory in container for project source files
ENV DOCKYARD_SRVPROJ=/srv/django

# musl: standard C library
# linux-headers: common library header
# build-base: build packages, e.g. gcc

RUN apk update
RUN apk add --update musl linux-headers build-base bash

# mariadb-dev for mysql client in django
RUN apk add mariadb-dev

# Create application subdirectories
WORKDIR $DOCKYARD_SRVHOME
RUN mkdir media static logs
VOLUME ["$DOCKYARD_SRVHOME/media/", "$DOCKYARD_SRVHOME/logs/"]

# Copy application source code to SRCDIR
COPY $DOCKYARD_SRC $DOCKYARD_SRVPROJ

# install python setuptools
RUN easy_install pip

# install the missing packages
RUN pip install pigar virtualenv

# since django source is not copied and volumes is not setup yet
# we left the other works in entrypoint

# Port to expose
EXPOSE 8000

# Copy entrypoint script into the image
WORKDIR $DOCKYARD_SRVPROJ
COPY docker/dev/scripts/docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
