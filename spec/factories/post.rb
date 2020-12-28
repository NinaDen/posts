FactoryBot.define do
  factory :post do
    user
    title { Faker::Lorem }
    body { Faker::Lorem }
  end
end
