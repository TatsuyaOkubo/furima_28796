FactoryBot.define do
  factory :purchase_receiver do
    token { 'kk11' }
    user_id { 1 }
    product_id { 1 }
    postcode { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    block { '1-1' }
    building { '東京ハイツ' }
    phone_number { '09012345678' }
    purchase_id { 1 }
  end
end
