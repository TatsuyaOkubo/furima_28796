class CreateReceivers < ActiveRecord::Migration[6.0]
  def change
    create_table :receivers do |t|
      t.string :postcode,       null: false, default: ""
      t.integer :prefecture_id,    null: false
      t.string :city,           null: false, default: ""
      t.string :block,          null: false, default: ""
      t.string :building,                    default: ""
      t.string :phone_number,   null: false, default: ""
      t.integer :purchase_id,   null: false, foreign_key: true
      t.timestamps
    end
  end
end
