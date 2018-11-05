# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create email: "blabla@gmail.com", encrypted_password: 1223


Grandparent.create name: "Francois", age: 90, address: "Be central", speciality: "Mongol", user: user
Grandparent.create name: "Romane", age: 110, address: "Be central", speciality: "Belly dancer", user: user
