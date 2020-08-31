class PurchaseReceiver

  include ActiveModel::Model
  attr_accessor :name, :user_id, :product_id, :postcode, :prefecture_id, :city, :block, :building, :phone_number, :purchase_id

  validates :user_id, :product_id, presence: true

  with_options presence: true do
    validates :user_id, :product_id
    validates :postcode, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Input half-width characters."}
    validates :city, :block, format: { message: "is invalid."}
    validates :phone_number, format: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width numbers."}
    validates :prefecture_id, numericality: { other_than: 1 }
  end
  validates :building { message: "is invalid."}

  def save
    purchase = Purchase.create(user_id: user_id, product_id: product_id)
    Receiver.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, purchase_id: purchase_id)
  end
end