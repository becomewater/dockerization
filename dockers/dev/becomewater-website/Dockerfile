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

RUN add-apt-repository -y ppa:ondrej/php
RUN apt-get update -y
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update -y && apt-get install -y php7.2-fpm php7.2-bcmath \
    php7.2-curl php7.2-gd php7.2-gmp php7.2-intl php7.2-json php7.2-mysql php7.2-opcache \
    php7.2-readline php7.2-xml php7.2-zip php7.2-mbstring \
    php7.2-xdebug

# xdebug
RUN echo "xdebug.remote_enable=on" >> /etc/php/7.2/mods-available/xdebug.ini \
    && echo "xdebug.remote_autostart=off" >> /etc/php/7.2/mods-available/xdebug.ini \
    && echo "xdebug.remote_connect_back=on" >> /etc/php/7.2/mods-available/xdebug.ini \
    && echo "xdebug.remote_port=9000" >> /etc/php/7.2/mods-available/xdebug.ini

WORKDIR /root

RUN curl -sS https://getcomposer.org/installer -o composer-setup.php
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer

RUN apt-get install -y nginx git

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash
RUN apt-get install -y nodejs

# testing connection
RUN apt-get install -y mysql-client

# QUEUE
RUN apt-get install -y supervisor

# ESC wallet
RUN apt-get install -y openssl libboost-all-dev libssl-dev
RUN apt-get install -y build-essential make cmake

COPY local.docker.site.nginx.conf /etc/nginx/sites-enabled/default
COPY ./docker /docker

WORKDIR /website

ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]
