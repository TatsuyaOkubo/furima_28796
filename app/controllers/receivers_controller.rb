class ReceiversController < ApplicationController
  def create
    @receiver = PurchaseReceiver.new(receiver_params)
    @receiver.save
  end

  private

 def receiver_params
  params.require(:purchase_receiver).permit(:user_id, :product_id, :postcode, :prefecture_id, :city, :block, :building, :phone_number, :purchase_id)
 end
end
