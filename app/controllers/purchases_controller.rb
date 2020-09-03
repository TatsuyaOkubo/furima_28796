class PurchasesController < ApplicationController
  before_action :set_product, only: [:index, :create]
  before_action :move_to_session
  
  def index
    if current_user.id == @product.user.id
      redirect_to root_path
    end
  end

  def create
    @purchase = PurchaseReceiver.new(purchase_params)
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

  def set_product
    @product = Product.find(params[:product_id])
  end

  def move_to_session
    redirect_to new_user_session_path unless user_signed_in?
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product[:price],
      card: purchase_params[:token],
      currency:'jpy'
    )
  end
end
