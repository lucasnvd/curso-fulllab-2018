# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


=begin
100.times do
  random_years = Faker::Number.between(16, 70)
  name = Faker::Name.name

  puts "Creating user: #{name}"

  User.create(
  )
end
=end

# 2 maneira: Criando a instancia da classe e atribuindo os valores manualmente
100.times do
  random_years = Faker::Number.between(16, 70)
  name = Faker::Name.name

  u = User.new
  u.assign_attributes(
    birth_date: random_years.years.ago,
    email: Faker::Internet.email(name),
    name: name,
    number: random_years,
    address: Faker::Address.full_address,
    state:   Faker::Address.state_abbr,
    city:    Faker::Address.city
  )
  u.save
end