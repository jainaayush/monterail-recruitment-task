# frozen_string_literal: true

FactoryBot.define do
  factory :ticket do
    event
    available { 20 }
    price { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
  end
end
