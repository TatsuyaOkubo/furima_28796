class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_day
  belongs_to :user
  has_one_attached :image

  validates :image, :name, :description, :category, :status, :shipping_charge, :shipping_area, :shipping_day, :price, :user, presence: true
  validates :name, length: { maximum: 40 }
  validates :description, length: { maximum: 1000 }
  validates :price, inclusion: { in: (300..9999999)}

  #ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id, :status_id, :shipping_charge_id, :shipping_area_id, :shipping_day_id, numericality: { other_than: 1 } 
end
