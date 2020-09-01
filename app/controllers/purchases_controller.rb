class PurchasesController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
  end

  def create
    @purchase = Purchase.create(purchase_params)
    if @purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_params
    params.require(:purchase).merge(user_id: current_user.id, product_id: params[:product_id])
  end
end
