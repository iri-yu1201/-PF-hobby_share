FactoryBot.define do
  factory :user do
    name { Faker::Loerm.characters(number:5) }
    introduction { Faker::Loerm.characters(number:50) }
    email { Faker::Internet.email }
    password { Faker::Loerm.characters(number:7) }
  end
end