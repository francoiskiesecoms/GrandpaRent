# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



require "open-uri"
require "yaml"

file = Rails.root.join('db', 'seeds', 'grandparents.yml')
sample = YAML.load(open(file).read)

puts 'Creating user...'
users = {}
sample["users"].each do |user|
  users[user["slug"]] = User.create! user.slice("name", "email", "photo", "description", "password", "password_confirmation")
end

puts 'Creating grandparents...'
sample["grandparents"].each do |grandparent|
  user = users[grandparent["user_slug"]]
  Grandparent.create! grandparent.slice("name", "age", "address", "specialty", "description", "picture", "latitude", "longitude", "start_date", "end_date").merge(user: user)
end
