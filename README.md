# README @ becomewater/dockerization

Quick local development tools based on docker

## Docker toolkit installation/update

Just follow [INSTALL](INSTALL.md)

## Base usage

  Just run:

  ```
  $ ./console.sh
  ```

  and it should be more or less self-explanatory. Some examples are available with

  ```
  $ ./console.sh examples
  ```

## Latest set of projects configured in dockerization

  ```
  $ ./console.sh l

  List of available projects:

    [b]  dev/becomewater-website
         dev/mailcatcher

    [b] - project build use settings

  ```

## Setting up dev/ projects

First you need to configure dev/ projects hosts on your local Linux host.

 ```
 $ sudo su -
 # cat dockers/dev/hostnames-dockers >> /etc/hosts
 # exit
 ```

 projects may require your local git code repository as these setups are for project developers
