class Account::OrdersController < ApplicationController
   before_action :authenticate_user!

   def index
     @orders = current_user.orders.order("id DESC")
     @product_lists = current_user.product_lists
   end

   def show
     @order = Order.find_by_token(params[:id])
     @products = @order.products
   end
end
