FactoryBot.define do
  factory :item_comment do
    comment { Faker::Loerm.characters(number:30) }
  end
end