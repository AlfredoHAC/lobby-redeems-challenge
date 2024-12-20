# frozen_string_literal: true

FactoryBot.define do
  factory :item do
    id { SecureRandom.uuid }
    customer_product_id { SecureRandom.uuid }
    quantity { Faker::Number.within(range: 1..3) }

    trait :sized do
      after(:build) do |item, _|
        item.sizes = build_list(:size, 3, item: item)
      end
    end
  end
end
