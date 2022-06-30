# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

100.times do
  Federation.create(
    name: Faker::Company.name,
    foundation_date: Faker::Date.between(from: '1950-01-01', to: '2020-01-01')
  )
end

100.times do
  Club.create(
    name: Faker::Company.name,
    foundation_date: Faker::Date.between(from: '1950-01-01', to: '2020-01-01'),
    federation_id: Federation.all.sample.id
  )
end

100.times do
  Player.create(
    name: Faker::Name.name,
    birth_date: Faker::Date.between(from: '1986-01-01', to: '2002-01-01'),
    value: Faker::Commerce.price(range: 100000..90000000),
    club_id: Club.all.sample.id
  )
end