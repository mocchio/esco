FactoryBot.define do
  factory :room do
    name { Faker::Team.name }
    level_id { Faker::Number.between(from: 2, to: 4) }
    habit { Faker::Lorem.sentence }
    rule { Faker::Lorem.sentence }
    association :creator, factory: :user
  end
end
