# frozen_string_literal: true

FactoryBot.define do
  factory :question do
    id { SecureRandom.uuid }
    answer_type { :text }
    question { Faker::Lorem.question }
  end
end
