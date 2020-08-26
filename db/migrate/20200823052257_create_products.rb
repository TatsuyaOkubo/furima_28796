class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.text :image
      t.string :name
      t.text :description
      t.integer :category_id
      t.integer :status_id
      t.integer :shipping_charge_id
      t.integer :shipping_area_id
      t.integer :shipping_day_id
      t.integer :price
      t.integer :user_id
      t.timestamps
    end
  end
end
