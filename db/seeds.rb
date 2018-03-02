# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'Lucas Andrade', email: 'lucas@email.com', password: '123456', age: 21)
User.create(name: 'Ash Katchum', email: 'ash@email.com', password: '123456', age: 10)
User.create(name: 'Gary Oak', email: 'gary@email.com', password: '123456', age: 10)