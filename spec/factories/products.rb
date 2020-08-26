FactoryBot.define do
  factory :product do
    name                   { Faker::Name.initials(number: 3) }
    description            { Faker::Name.initials(number: 10)  }
    category_id            { 2 }
    status_id              { 2 }
    shipping_charge_id     { 2 }
    shipping_area_id       { 2 }
    shipping_day_id        { 2 }
    price                  { 1000 }
    user_id                { 7 }
    association :user
  end
end