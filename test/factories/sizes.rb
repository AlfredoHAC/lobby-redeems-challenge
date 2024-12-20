# frozen_string_literal: true

FactoryBot.define do
  factory :size do
    id { SecureRandom.uuid }
    name { Faker::Alphanumeric.alpha(number: 1).upcase }
    inventory_amount { Faker::Number.within(range: 1..15) }
  end
end
