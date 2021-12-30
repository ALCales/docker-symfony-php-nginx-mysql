
# Docker + PHP 8.1 + Xdebug 3 + MySQL 8 + Nginx 1.21 + Symfony Boilerplate 🐳
___
## Description

This is a basic stack for running Symfony into Docker containers.
Here are the docker-compose built images:

- `nginx`, acting as the webserver v1.21.
- `php`, the PHP-FPM container with the 8.0 version of PHP.
- `mysql` which is the MySQL database container with a **MySQL 8.0** image.

## Installation

1. Clone this repository

2. Edit enviroment variable in ``.env`` file
   1. The value of the variable `NGINX_SERVER_NAME` is the `server_name` used in NGINX.
   

4. Go inside folder `./docker` and start containers.
   ```
   docker compose up -d build
   ```
5. You should work inside the `php` container.
   ```
   docker compose exec php sh
   ```
6. Check requirements for a Symfony application
   ```
   symfony check:requirements
   ```
   you will see the following output in the terminal
   ```
   [OK]                                             
   Your system is ready to run Symfony projects
   ```
7. Create a new Symfony project
   ```
   symfony new .
   ```

## Xdebug
Available by default. Configure `/docker/php/xdebug.ini`
- In case you want to deactivate it:
```
xdebug.mode=off
```
- In case you need debug only requests with IDE KEY: PHPSTORM from frontend in your browser:
```
xdebug.start_with_request = no
xdebug.idekey=PHPSTORM
```
- In case you need debug any request to an api (by default):
```
xdebug.start_with_request = yes
```

## Directory strcuture
```
Project (/var/www/)
├── docker
│   ├── mysql
│   ├── nginx
│   └── php
└── app
    └── .. all symfony content
```
