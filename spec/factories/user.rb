FactoryBot.define do
  password = Faker::Internet.password(min_length: 6, max_length: 10)

  factory :user do
    name { Faker::Lorem.characters(number:5) }
    introduction { Faker::Lorem.characters(number:50) }
    email { Faker::Internet.email }
    password { password }
    password_confirmation { password }
  end
end