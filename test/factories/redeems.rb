# frozen_string_literal: true

FactoryBot.define do
  factory :redeem do
    id { SecureRandom.uuid }
    status { :pending }
    redeemer_name { Faker::Name.name }
    redeemer_email { Faker::Internet.email }
    redeemer_document_number { Faker::IdNumber.brazilian_citizen_number }
    redeemer_zipcode { Faker::Address.zip_code }
    redeemer_street { Faker::Address.street_name }
    redeemer_number { Faker::Address.building_number }
    redeemer_neighborhood { Faker::Address.community }
    redeemer_city { Faker::Address.city }
    redeemer_state { Faker::Address.state }
    redeemer_country { Faker::Address.country }
    redeemer_phone { Faker::PhoneNumber.phone_number_with_country_code }
  end
end
