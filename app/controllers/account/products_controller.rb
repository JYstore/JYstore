class Account::ProductsController < ApplicationController
  def show
    @orders = current_user.orders.order("id DESC")
    @products = @order.products
  end
end
