# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times do
  random_years = Faker::Number.between(16, 70)
  name = Faker::Name.name

  puts "Creating user: #{name}"

  User.create(
    birth_date: random_years.years.ago,
    address: Faker::Address.full_address,
    number:  random_years,
    state:   Faker::Address.state_abbr,
    email:   Faker::Internet.email(name),
    name:    name,
    city:    Faker::Address.city
  )
end
