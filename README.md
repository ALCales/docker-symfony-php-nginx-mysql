# Docker + PHP 8.1 + Xdebug 3 + MySQL 8 + Nginx 1.21 + Symfony Boilerplate 🐳

## Description

This is a basic stack for **create y running Symfony project** into Docker containers.
Here are the docker-compose built images:

- `nginx`, acting as the webserver v1.21.
- `php`, the PHP-FPM container with the 8.1 version of PHP. Xdebug is available by default.
- `mysql` which is the MySQL database container with a **MySQL 8.0** image.

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

## Installation

### 🚀 Option 1: Quick Start (Recommended)

1. Clone this repository.
2. (Optional) Customize your local domain by editing the variable `NGINX_SERVER_NAME` in [`docker/.env`](docker/.env#L11) **before** running the setup.
3. From the project root, run:
   ```
   chmod +x setup.sh
   ./setup.sh
   ```
   This script will:
   - Build and start all containers.
   - If `/app` is empty, it will create a new Symfony project automatically.
   - Set correct permissions for the `var` directory.

---

### 🛠️ Option 2: Manual Step-by-Step

#### Docker containers

1. Clone this repository.
2. Go inside folder `/docker`.
3. Edit environment variables in `.env` file
   1. The value of the variable `NGINX_SERVER_NAME` is the `server_name` used in NGINX.
4. Build/run containers.
   ```
   docker-compose build
   docker-compose up -d
   ```

#### Symfony project

1. You should work inside the `php` container.
   ```
   docker-compose exec php bash
   ```
2. Check requirements for a Symfony application
   ```
   symfony check:requirements
   ```
   you will see the following output in the terminal
   ```
   [OK]
   Your system is ready to run Symfony projects
   ```
3. Create a new Symfony project
   ```
   symfony new .
   ```
   Your Symfony project will be installed in `/app` folder. Now you can access it from the browser through the domain that you have specified in the `NGINX_SERVER_NAME` variable of the `.env` file.

Now you should have your Symfony project started and accessible from the domain you have configured in `NGINX_SERVER_NAME`.
<em>Remember that this domain must be pointing to your localhost.</em>

![alt text](https://i.postimg.cc/KYds8XBv/symfony-landing.png)

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
