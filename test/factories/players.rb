FactoryBot.define do
  factory :player do
    name { Faker::Company.name }
    birth_date { Faker::Date.between(from: '1986-01-01', to: '2002-01-01') }
    value { Faker::Commerce.price(range: 100000..90000000) }
    club
  end
end
