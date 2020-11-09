
## Users Stories

As an administrator,
I want to load the receipts in the database,
so the users cans look for them with the app

As a visitor,
I want a way to save the ingredients I have,
so the application know which receipts could be suggested

As a visitor,
I want to see the receipts suggested for the ingredients I've filled,
so I can select on of the receipts

As a visitor,
I want to select one receipt,
so I can see the details and start to cook it

## Docker

The Docker file is based on Ubuntu and create a Postgresql 12.4 image with
Ruby 2.7.x and Git. Heroku CLI will be installed (snap app).

## Heroku

Configuration here

## Docker

You need Docker and Docker-Compose for this project.

Run into a container

```shell
docker-compose run --rm web bash
```

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
