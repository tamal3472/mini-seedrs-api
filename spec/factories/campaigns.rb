FactoryBot.define do
  factory :campaign do
    name { 'Double policy' }
    target_amount { 10_000.99 }
    sector { 'Real state' }
    country { 'Bangladesh' }
    investment_multiple { 10.00 }
  end
end
