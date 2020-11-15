# Frigo Magic

This is a little challange. The baseline is:

> (French)  
> J'attends des amis pour dîner mais je n'ai pas le temps de faire des courses.
> Sachant ce que j'ai dans le frigo, qu'est ce que je peux préparer.
>
> (English translated)  
> I'm waiting friends for dinner but I don't have time for shopping. Knowing
> what I have in the fridge, what can I cook.

<a href="https://youtu.be/tb46TmlnTT4" tag="get the video">See the video for a quick demo</a>

Want a live test ? Try https://frigomagik.herokuapp.com/ on Heroku.

## Current stack

This application use:
- Rails 6 with Ruby 2.7
- Postgresl (v12.4)

I began to play with React but I have not enough time to finish something usable
(localhost:3000/with_react). Perhaps for later. For now, the fallback is to
use the old way with simple form.

## Users Stories

User stories for this prototype. Be aware the finalized prototype has
a pre-filled list of ingredients on the home page to kickly test the app.

### Story 1 (seed)

As an administrator,
I want to seed the application with default recipes in the database,
So the users cans look for them with the app

### Story 2

As a visitor,
I want a way to write the ingredients I have,
So the application know which recipes could be suggested

### Story 3

As a visitor,
I want a liste of suggested recepts for the ingredients I've filled,
So I can select one of them

### Story 4

As a visitor,
I want to see the details of one recipe,
So I can cook something with it

> This last story is useful to check the result.

## Docker

The development for this project is within Docker containers. I use today this
workflow to keep current machine free from incompatibles implementations.

The Docker file is based on Debian and build an environnement with:
- Ruby 2.7.x
- Git command
- Heroku CLI

The docker-compose file is set to start Postgresql 12.4 on Alpine image.

You should use Docker + Docker-compose to play with this rails app, but
it's not mandatory.

Container for web application is called `web` (with port forward on 3000) and
the one which start Postgresql is called `db`.

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

Not time for now, but perhaps in a near future.

## Limitations

Current search algorithm use `ilike` on a list of ingredients against a text
field containing the original ingredients (with the quantity). This produce
false positive results: With a recipe having "oeuf" and another having "boeuf",
a search on "oeuf" find also the recipe with "boeuf". This behavior is
not desired.

Other limitation is the search which apply on not indexed column (full scan).
