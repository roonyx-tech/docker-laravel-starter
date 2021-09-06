
# Install

## Dependies for Window
* Install make
http://gnuwin32.sourceforge.net/packages/make.htm
* Install Cygwin for sh
http://www.cygwin.com/
* Add paths to user enviroment

## Step by step

```
$ touch .env
```
Add to `.env`:
```
APP_NAME=LARAVEL_STARTER
APP_ENV=local
APP_KEY=base64:X2IYnnt3pb9ooz5zdYBhf4yIlLW9Xjn9mEt8dOhgVME=
APP_DEBUG=true
APP_URL=http://localhost:8080

LOG_CHANNEL=stack

DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=mydb
DB_USERNAME=root
DB_PASSWORD=root

BROADCAST_DRIVER=log
CACHE_DRIVER=file
QUEUE_CONNECTION=sync
SESSION_DRIVER=file
SESSION_LIFETIME=120

REDIS_HOST=127.0.0.1
REDIS_PASSWORD=null
REDIS_PORT=6379

MAIL_MAILER=smtp
MAIL_HOST=smtp.mailtrap.io
MAIL_PORT=2525
MAIL_USERNAME=
MAIL_PASSWORD=
MAIL_ENCRYPTION=null
MAIL_FROM_ADDRESS=mockup_generator@email.com
MAIL_FROM_NAME="${APP_NAME}"

PUSHER_APP_ID=
PUSHER_APP_KEY=
PUSHER_APP_SECRET=
PUSHER_APP_CLUSTER=mt1

MIX_PUSHER_APP_KEY="${PUSHER_APP_KEY}"
MIX_PUSHER_APP_CLUSTER="${PUSHER_APP_CLUSTER}"

PROJECT_PATH=/opt/app/

SCOUT_DRIVER=algolia
SCOUT_QUEUE=true
ALGOLIA_APP_ID={SET_APP_ID}
ALGOLIA_SECRET={SET_SECRET}

SCOUT_PREFIX=mg_local_

DASHBOARD_PREFIX=/admin

AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
AWS_DEFAULT_REGION=us-east-1
AWS_BUCKET=
AWS_BUCKET_USERS=
FILESYSTEM_DRIVER=s3
AWS_URL=
```
```
$ touch ./frontend/.env.local
```
Add to `.env.local`:
```
SERVER='http://localhost:8080/'
SCOUT_PREFIX='mg_local_'
ALGOLIA_APP_ID='{SET_APP_ID}'
ALGOLIA_SEARCH_API_KEY='{SET_API_KEY}'
AMAZON_SERVER='https://fb-plus-mockup-admin.s3.amazonaws.com'
AMAZON_SERVER_USERS='https://fb-plus-mockup-users.s3.amazonaws.com'
```
```
$ sh build-updates.sh
$ make console-php
$ composer install
$ exitе
$ sh run-updates.sh
```

## How add php extensions
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
###Check the Database
```
$ make console-mysql
$ mysql -uroot -p 
```
Enter the DB password and choose DB

```
$ use mydb
```
Now you can make db queries.

###To Enter to the php container
```make console-php```

To check all the commands see ```./Makefile```

Also you can improve ```./build-updates.sh``` and ```./run-updates.sh``` scripts