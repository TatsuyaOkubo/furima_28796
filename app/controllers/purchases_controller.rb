class PurchasesController < ApplicationController

  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.save
      redirect_to root_path
    else
      render :new
    end
  end
end
