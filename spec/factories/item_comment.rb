FactoryBot.define do
  factory :item_comment do
    comment { Faker::Lorem.characters(number:30) }
    user
    item
  end
end