FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email {'veg@gmail.com'}
    password_digest {'veggies'}
  end
end