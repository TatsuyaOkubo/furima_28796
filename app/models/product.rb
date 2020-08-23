class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_days

  #空の投稿を保存できないようにする
  validates :image, :name, :description, :category, :status, :shipping_charge, :shipping_area, :shipping_days, :price, :user, presence: true

  #ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id, :status_id, :shipping_charge_id, :shipping_area_id, :shipping_days_id, numericality: { other_than: 1 } 
end
