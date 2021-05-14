class ProductListsController < ApplicationController
  def show
    @order = Order.find_by_token(params[:order_id])
    @product_lists = @order.product_lists
  end
end
