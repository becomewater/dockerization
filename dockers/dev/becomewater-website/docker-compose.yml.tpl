version: '2'
services:
  website:
    build: .
    ports:
      - "127.0.0.1:8101:80"
    networks:
      default:
        ipv4_address: 172.16.22.101
    environment:
      - MYSQL_ROOT_PASSWORD=becomewater
      - MYSQL_DATABASE=becomewater
    volumes:
      - DEV_REPO:/website
    depends_on:
      - website_db
    links:
      - website_db
  website_db:
    image: "percona:5.7"
    command: ['--character-set-server=utf8mb4', '--collation-server=utf8mb4_unicode_ci']
    ports:
      - "127.0.0.1:8102:3306"
    networks:
      default:
        ipv4_address: 172.16.22.102
    environment:
      - MYSQL_ROOT_PASSWORD=becomewater
      - MYSQL_DATABASE=becomewater
      - MYSQL_PASSWORD=
    volumes:
      - ./var/percona:/var/lib/mysql

networks:
  default:
    external:
      name: becomewater_net
