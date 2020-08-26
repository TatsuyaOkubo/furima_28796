require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
    @product.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品出品機能' do
    context '商品出品がうまくいくとき' do
      it "imageとname、description、category_id、status_id、shipping_charge_id、shipping_area_id、shipping_day_id、price、user_idが存在すれば登録できる" do
        expect(@product).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it "imageが空だと出品できない" do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが空だと出品できない" do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
      it "descriptionが空だと出品できない" do
        @product.description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end
      it "category_idが空だと出品できない" do
        @product.category_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
      it "status_idが空だと出品できない" do
        @product.status_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Status can't be blank")
      end
      it "shipping_charge_idが空だと出品できない" do
        @product.shipping_charge_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping charge can't be blank")
      end
      it "shipping_area_idが空だと出品できない" do
        @product.shipping_area_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping area can't be blank")
      end
      it "shipping_day_idが空だと出品できない" do
        @product.shipping_day_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping day can't be blank")
      end
      it "priceが空だと出品できない" do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it "価格の範囲が¥299以下では登録できない" do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not included in the list")
      end
      it "価格の範囲が¥10,000,000以上では登録できない" do
        @product.price = 10000000
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not included in the list")
      end
    end
  end
end
