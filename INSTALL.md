# INSTALL @ becomewater/dockerization

Quick local development tools based on docker

## Requirements for host

  * Linux with bash, sudo, docker and docker-compose
  * git - for projects dev/ you need local repo clones to be linked into docker volumes
  * nginx - if you want to do some proxy setup, it is NOT REQUIRED for local dev/test

### Recommended versions

  * docker - dev/tested on 18.03.1-ce
  * docker-compose - dev/tested on 1.21.2

### Installing required tools

 If you have Ubuntu 16.04 or compatible OS (aptitude, python-pip), the script will check and recommend to install the software for you. Just run and follow the messages:

```
 $ ./console.sh
```

  For other OS. Just follow:
   * https://docs.docker.com/install
   * https://docs.docker.com/compose/install/
