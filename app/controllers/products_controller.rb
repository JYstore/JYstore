class ProductsController < ApplicationController
  def index
    @products = Product.where(:is_hidden => false)
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    current_cart.add_product_to_cart(@product)
    flash[:notice] = "成功加入购物车"
    redirect_to product_path
  end

  private

  def product_params
    params.require(:product).permit(:is_hidden)
  end
end