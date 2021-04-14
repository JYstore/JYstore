class ProductsController < ApplicationController
  def index
    @products = Product.where(:is_hidden => false)
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    redirect_to product_path
    flash[:notice] = "测试加入购物车"
  end

  private

  def product_params
    params.require(:product).permit(:is_hidden)
  end
end
