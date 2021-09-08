
# About 
Docker Laravel 8.x Starter Kit was created as a way to save time when starting a new Laravel based project. We have taken the most common functionality and configuration in our existing Laravel projects, and put those into this project. Simply clone this project, and change the git remote to your remote repository. Docker Laravel Starter Kit is ready to start with docker-compose.


## Table of contents
- [Out-of-the-box functionality](https://github.com/roonyx-tech/docker-laravel-starter#install)
- [Getting started](https://github.com/roonyx-tech/docker-laravel-starter#getting-started)
  - [Dependies for Window](https://github.com/roonyx-tech/docker-laravel-starter#dependies-for-window)
  - [Init](https://github.com/roonyx-tech/docker-laravel-starter#init)
  - [Docker build and run the application](https://github.com/roonyx-tech/docker-laravel-starter#docker-build-and-run-the-application)
- [How to add php extensions](https://github.com/roonyx-tech/docker-laravel-starter#how-to-add-php-extensions)
- [To work with containers](https://github.com/roonyx-tech/docker-laravel-starter#install)
  - [Check the Database](https://github.com/roonyx-tech/docker-laravel-starter#check-the-database)
  - [To Enter to the php container](https://github.com/roonyx-tech/docker-laravel-starter#to-enter-to-the-php-container)
- [How to add php extensions](https://github.com/roonyx-tech/docker-laravel-starter#how-to-add-php-extensions)
- [Tests and Lints](https://github.com/roonyx-tech/docker-laravel-starter#tests-and-lints)
  - [To Run unit tests](https://github.com/roonyx-tech/docker-laravel-starter#to-run-unit-tests)
  - [To Lint the files](https://github.com/roonyx-tech/docker-laravel-starter#to-lint-the-files)

## Out-of-the-box functionality
- [docker-compose](https://docs.docker.com/compose/) configuration for start project
- [NoVerify](https://github.com/VKCOM/noverify) fast php linter 
- [laravel-cors](https://github.com/fruitcake/laravel-cors) CORS Middleware for Laravel

  
## Getting Started

#### Dependies for Window
* Install make
http://gnuwin32.sourceforge.net/packages/make.htm
* Install Cygwin for sh
http://www.cygwin.com/
* Add paths to user environment

#### Init
- Install make if need.
- Clone Laravel Starter Kit

- Go to root directory of the project and create ```.env``` from ```.env.example``` template
```
$ cp .env.example .env
```
#### Docker build and run the application
```
$ make up-build-d
```
- Enter the php container, install dependencies, set the app key and exit the container
```
$ make console-php
$ composer install
$ php artisan key:generate
$ php artisan optimize:clear
$ exit
```
- Run migrations and seeds.
```
$ sh run-updates.sh
```
- Create a new repository on GitHub, BitBucket, or your own server

- Change the git remote to your new repository

- Push changes

## How to add php extensions
See the 
```./Dockerfile```
to supplement the main application container 

See the 
```./docker/supervizor/supervizor.Dockerfile```
to improve the supervizor container. A supervisor working with the queue is started in this container.

This container 
```./docker/scheduler/scheduler.Dockerfile```
working with ```./crontab```

## To work with containers
#### Check the Database
```
$ make console-mysql
$ mysql -uroot -p 
```
Enter the DB password and choose DB

```
$ use mydb
```
Now you can make db queries.

#### To Enter to the php container
```$ make console-php```

To check all the commands see ```./Makefile```

Also you can improve ```./build-updates.sh``` and ```./run-updates.sh``` scripts

## Tests and Lints
#### To Run unit tests
- To run the unit tests 

```$ make unit```
- To show the coverage 

```make unit-coverage```
- To run specified test suite

```make unit-feature```
#### To Lint the files
- To lint the files

```make lint```
- To show list of checkers

```make lint-checkers```
- To get noVerify linter version

```make lint-v```
- To generate markdown checkers documentation

```make lint-checkers-doc```