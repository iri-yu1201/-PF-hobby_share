FactoryBot.define do
  factory :item do
    title { Faker::Loerm.characters(number:5) }
    detail { Faker::Loerm.characters(number:80) }
    photo { Faker::Avatar.image }
  end 
end