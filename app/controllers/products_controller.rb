class ProductsController < ApplicationController
  def index
    @products = Product.where(:is_hidden => false)
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:is_hidden)
  end
end
