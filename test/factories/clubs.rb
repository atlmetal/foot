FactoryBot.define do
  factory :club do
    name { Faker::Company.name }
    foundation_date { Faker::Date.between(from: '1950-01-01', to: '2020-01-01') }
    federation
  end
end
