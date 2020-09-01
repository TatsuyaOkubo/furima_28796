class PurchasesController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
  end

  def create
    @purchase = PurchaseReceiver.new(purchase_params)
    @product = Product.find(params[:product_id])
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_params
    params.permit(:token, :postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, product_id: params[:product_id])
  end

  def pay_item
    Payjp.api_key = "sk_test_ab2858650a33c6082850d7a1"  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @product[:price],  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

end
