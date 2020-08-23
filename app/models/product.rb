class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  #空の投稿を保存できないようにする
  validates :image, :name, :description, :category_id, :status_id, :shipping_charge_id, :shipping_area_id, :shipping_days_id, :price, :user_id, presence: true

  #ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 } 
end
