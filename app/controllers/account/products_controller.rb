class Account::ProductsController < ApplicationController
  def show
    @order = Order.find_by_token(params[:order_id])
    @products = @order.products
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price, :image, :is_hidden, :category_id, :description_detail, :advantage, :repertoire, :technical_parameters, :adaptive)
  end
end
