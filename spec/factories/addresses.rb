FactoryBot.define do
  factory :address do
    postal_code          { Faker::Address.postcode }
    prefecture_id        { Faker::Number.between(from: 2, to: 48) }
    city                 { Faker::Address.city }
    address              { Faker::Address.street_address }
    building             { Faker::Address.secondary_address }
    phone_number         { Faker::Phone.number }
    association :order
  end
end
