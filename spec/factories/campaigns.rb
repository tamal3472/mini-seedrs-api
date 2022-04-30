FactoryBot.define do
  factory :campaign do
    name { Faker::Name.name }
    target_amount { Faker::Commerce.price(range: 110..100_000.0) }
    sector { Faker::Commerce.department }
    country { Faker::Address.country }
    investment_multiple { Faker::Commerce.price(range: 1..100.0) }
  end
end
