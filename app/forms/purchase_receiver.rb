class PurchaseReceiver
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :postcode, :prefecture_id, :city, :block, :building, :phone_number, :purchase_id, :token

  with_options presence: true do
    validates :user_id, :product_id, :token
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city, :block
    validates :phone_number, format: { with: /\A\d{10}\z|\A\d{11}\z/ }
  end

  def save
    purchase = Purchase.create(user_id: user_id, product_id: product_id)
    Receiver.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end
