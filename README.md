
## Users Stories

As an administrator,
I want to seed the application with default recipes in the database,
So the users cans look for them with the app

As a visitor,
I want a way to write the ingredients I have,
So the application know which recipes could be suggested

As a visitor,
I want a liste of suggested recepts for the ingredients I've filled filled,
So I can select one of them

As a visitor,
I want to see the details of one recipe,
So I can cook something with it

## Docker

The Docker file is based on Debian and prepare environnement with:
- Ruby 2.7.x
- Git command
- Heroku CLI

The docker-compose file is set to start Postgresql 12.4 on Alpine image.

You should use Docker + Docker-compose to play with this rails app, but
it's not mandatory.

### Commands to run (with docker-compose)

prepare the application:

```
docker-compose run --rm web bundle exec rake db:prepare
```

run the tests

```
docker-compose run --rm web bundle exec rails test
```

seed database with example datas

```
docker-compose run --rm web bundle exec rake db:seed
```

run the application with the command bellow before browse http://127.0.0.1:3000/

```
docker-compose up -d
```

get logs of running application

```
docker-compose logs -f web
```

stop the application, remove web & db containers

```
docker-compose down
```

### Erase all data for Dev

Remove database with rake command:

```
docker-compose run --rm web bundle exec rake db:drop
```

Or remove manually all files while containers are down by removing the `tmp/db`
folder (should need _root_ privileges: `sudo rm -r tmp/db`).

## Heroku

Configuration here


---

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
