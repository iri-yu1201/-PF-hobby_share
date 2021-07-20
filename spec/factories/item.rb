FactoryBot.define do
  factory :item do
    title { Faker::Lorem.characters(number:5) }
    detail { Faker::Lorem.characters(number:80) }
    photo { Faker::Avatar.image }
    user
  end
end