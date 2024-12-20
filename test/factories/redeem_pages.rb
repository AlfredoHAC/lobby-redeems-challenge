# frozen_string_literal: true

FactoryBot.define do
  factory :redeem_page do
    id { SecureRandom.uuid }
    status { :active }
    title { Faker::Lorem.sentence }
    administrative_link { Faker::Internet.url(host: 'faker.com', path: "/api/v1/redeem_pages/edit/#{id}") }
    redemption_link { Faker::Internet.url(host: 'faker.com', path: '/api/v1/redeem/new') }

    after(:build) do |redeem_page, _|
      redeem_page.items = build_list(:item, 2, redeem_page: redeem_page) if redeem_page.items.empty?
    end

    trait :with_extra_questions do
      after(:build) do |redeem_page, _|
        redeem_page.extra_questions = build_list(:question, 2, redeem_page: redeem_page)
      end
    end
  end
end
