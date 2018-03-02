# README

This is Pokemon API in Rails.

I made this API only to study and to help people to study.

It's a ruby back-end with a cool data to study all those new JavaScript frameworks, so you can use to create a Pokedex, or even a rpg game in React, Agular, Vue, React Native and etc. It's nice for study and also for teach kids.

## License

The API and the data has different licenses.
The API is what I created ans it's under MIT license, so can use as you want with any database of your responsibility.

If you want to use with the data of this project be aware that you should only use it for studies. You may not use it for any commercial proposal or any other activity that violates Nitendo's copyright.

I took the data from Kaggle, images and pokemon info are Release under COC public Domain.

### Images
[Pokemon Images From Kaggle](https://www.kaggle.com/dollarakshay/pokemon-images), under [COC Public Domain](https://creativecommons.org/publicdomain/zero/1.0/)

### Info
[Pokemon Info from Kaggle](https://www.kaggle.com/abcsds/pokemon), under [COC Public Domain](https://creativecommons.org/publicdomain/zero/1.0/)

## API Doc

### Config your environment
This project uses:
* Rails 5.1.4
* Ruby 2.3.1
* gem mysql2 for database

### Steps
```
git clone https://github.com/LucasAndrad/pokedex-api-rails.git
```
---

Set your your user db credentials at _config/database.yml_
```ruby
default: &default
  adapter: mysql2
  encoding: utf8
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: yourUserName
  password: yourPassword
  socket: /var/run/mysqld/mysqld.sock
```

---
```
bundle install
```
---

```
rake db:create db:migrate
rake db:seed:pokemons
```

---

```
rails s
```

Then you can test with Bulbasaur
```
curl http://localhost:3000/pokemons/1

{"id":1,"number":1,"name":"Bulbasaur","type_1":"Grass","type_2":"Poison","total":318,"hp":45,"attack":49,"defense":49,"sp_atk":65,"sp_def":65,"speed":45,"generation":1,"legendary":false,"image":"0001.png","created_at":"2017-12-04T01:08:10.000Z","updated_at":"2017-12-04T01:08:10.000Z"}
```

### API endpoints and commands
To see all pokemons:
```
curl http://localhost:3000/pokemons
```

---

To see a pokemon by id:
```
curl http://localhost:3000/pokemons/5

{"id":5,"number":4,"name":"Charmander","type_1":"Fire","type_2":"","total":309,"hp":39,"attack":52,"defense":43,"sp_atk":60,"sp_def":50,"speed":65,"generation":1,"legendary":false,"image":"0004.png","created_at":"2017-12-04T01:08:10.000Z","updated_at":"2017-12-04T01:08:10.000Z"}
```

---

To search pokemons by NAME, TYPE or NUMBER:
```
http://localhost:3000/pokemons/search?term=lugia

[{"id":270,"number":249,"name":"Lugia","type_1":"Psychic","type_2":"Flying","total":680,"hp":106,"attack":90,"defense":130,"sp_atk":90,"sp_def":154,"speed":110,"generation":2,"legendary":true,"image":"0249.png","created_at":"2017-12-04T01:08:24.000Z","updated_at":"2017-12-04T01:08:24.000Z"}]
```

--- 

Create account
```
curl -H "Content-Type: application/json" -X POST -d
'{"user": {"email":"ash@email.com","password":"123456","name":"Ash Katchum","age":"10"}}' 
http://localhost:3000/users
```
--- 


Login
```
curl -H "Content-Type: application/json" -X POST -d
'{"email": "lucas@email.com","password":"123456"}' http://localhost:3000/authenticate
```

You will get the token
```
{"auth_token":"eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1MjAxMDc0MDB9.nwDSYe3-XExyB3RMKgAQ10EsAGybhsuH6f_vViE_xN4"}
```

--- 


Catch pokemon

To catch a pokemon you must to be login, get the token and use here

```
curl -H "Authorization: {{ Token value }}
eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1MjAxMDgzNjV9.5p3Y6jCvHQNWdLGyoIBEHMcdR7otkAAXZXR6DT3qaVc"
-H "Content-Type: application/json" -X POST -d 
'{"pokemons_catched": {"level":"5","user_id":"3","pokemon_id":"1"}}'
http://localhost:3000/catch
```

Output
```
{"id":1,"level":5,"pokemon_id":1,"user_id":1,"created_at":"2018-03-02T20:21:04.000Z","updated_at":"2018-03-02T20:21:04.000Z"}
```
--- 

See your pokemons
To see your pokemons you also need to login, and user your token.
Set your user ID here: 
```
http://localhost:3000/users/{{ user_id }}/pokemons
```

```
curl -H "Authorization: 
eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1MjAxMDgzNjV9.5p3Y6jCvHQNWdLGyoIBEHMcdR7otkAAXZXR6DT3qaVc" 
http://localhost:3000/users/1/pokemons

```

--- 

Level Up
To level up any pokemon you need to login and use your token
Set your pokemon_catched ID here: 
```
http://localhost:3000/level_up/{{ pokemon_catched_id }}
```

```
curl -H "Authorization: 
eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1MjAxMDgzNjV9.5p3Y6jCvHQNWdLGyoIBEHMcdR7otkAAXZXR6DT3qaVc" 
-H "Content-Type: application/json" -X PUT http://localhost:3000/level_up/1

```

--- 
Battle

```
```