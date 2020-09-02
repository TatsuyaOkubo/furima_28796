class PurchaseReceiver

  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :postcode, :prefecture_id, :city, :block, :building, :phone_number, :purchase_id, :token

  with_options presence: true do
    validates :user_id, :product_id, :city, :block, :token
    validates :postcode, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Input half-width characters."}
    validates :phone_number, length: { maximum: 11 }, format: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width numbers."}
    validates :prefecture_id, numericality: { other_than: 1 }
  end

  def save
    purchase = Purchase.create(user_id: user_id, product_id: product_id)
    Receiver.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end