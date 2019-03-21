FactoryBot.define do
  factory :food do
    # unique name
    sequence(:name) { |n| "#{Faker::Lorem.word}#{n}" }
    # non unique name
    # name { Faker::Lorem.word }
    region { Faker::Lorem.word }
    type {'fruit'}
  end
end