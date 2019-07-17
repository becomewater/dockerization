FROM ubuntu:16.04

ENV TERM xterm
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV TZ=Europe/Warsaw

RUN apt-get update -y
RUN apt-get install -y apt-utils
RUN apt-get upgrade -y

RUN apt-get install -y apt-utils

RUN apt-get install -y libreadline6 libreadline6-dev libterm-readline-gnu-perl

RUN apt-get install -y software-properties-common curl wget locales

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get install -y ruby-dev rubygems build-essential bison openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libxml2-dev autoconf libc6-dev ncurses-dev automake libtool libsqlite3-dev
# RUN gem install bundler
RUN gem install mailcatcher

COPY ./docker /docker

ENTRYPOINT ["mailcatcher", "--ip", "0.0.0.0", "--http-port", "80", "-f"]
