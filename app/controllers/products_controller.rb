class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :create, :edit, :show]
  def index
    @products = Product.order('created_at DESC')
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def destroy
  end

  def edit
  end

  private

  def product_params
    params.require(:product).permit(:image, :name, :description, :category_id, :status_id, :shipping_charge_id, :shipping_area_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end
end
