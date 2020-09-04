require 'rails_helper'

RSpec.describe PurchaseReceiver, type: :model do
  describe '商品の購入' do
    before do
      @purchase = FactoryBot.build(:purchase_receiver)
    end
    it 'すべての値が正しく入力されていれば購入できること' do
      expect(@purchase).to be_valid
    end
    it 'tokenが空だと購入できないこと' do
      @purchase.token = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Token can't be blank")
    end
    it 'postcodeが空だと購入できないこと' do
      @purchase.postcode = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Postcode can't be blank")
    end
    it 'postcodeにハイフンがないと購入できないこと' do
      @purchase.postcode = '1234567'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('Postcode is invalid')
    end
    it 'prefecture_idが1だと購入できないこと' do
      @purchase.prefecture_id = 1
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('Prefecture must be other than 1')
    end
    it 'cityが空だと購入できないこと' do
      @purchase.city = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("City can't be blank")
    end
    it 'blockが空だと購入できないこと' do
      @purchase.block = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Block can't be blank")
    end
    it 'phone_numberが空だと購入できないこと' do
      @purchase.phone_number = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberにハイフンがあると購入できないこと' do
      @purchase.phone_number = '090-12345678'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('Phone number is invalid')
    end
    it 'phone_numberが12桁以上であると購入できないこと' do
      @purchase.phone_number = '090123456789'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('Phone number is invalid')
    end
  end
end
