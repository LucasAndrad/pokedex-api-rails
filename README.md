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

--- 


Login

--- 


Get pokemon
See your pokemons