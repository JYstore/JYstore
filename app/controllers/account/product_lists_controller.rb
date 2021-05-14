class Account::ProductListsController < ApplicationController

  def index
    @order = Order.find_by_token(params[:order_id])
    @product_lists = current_user.product_lists
      current_cart.cart_items.each do |cart_item|
        product_list.order = @order
        product_list.product_name = cart_item.product.title
        product_list.product_price = cart_item.product.price
        product_list.quantity = cart_item.quantity
      end
  end

  def show
    @order = Order.find_by_token(params[:order_id])
    @product_lists = @order.product_lists
  end

end
