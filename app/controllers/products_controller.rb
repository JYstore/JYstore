class ProductsController < ApplicationController
  def index
    if params[:category].blank?
      @products = Product.where(:is_hidden => false).paginate(:page => params[:page], :per_page => 8)
    else
      @category = Category.find_by(id: params[:category]) #找出是哪个category
      @products = Product.where(:category => @category).paginate(:page => params[:page], :per_page => 8) #找出这个category下的Job
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def welcome_show
    @products = Product.where(:is_hidden => false)

    @product_xians = Product.where(:category => "1").limit(4)
    @product_xias = Product.where(:category => "2").limit(4)
    @product_hots = Product.where(:category => "3").limit(4)

  end

  def add_to_cart
    @product = Product.find(params[:id])
    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "你已成功将 #{@product.title} 加入购物车"
    else
      flash[:warning] = "你的购物车内已有此物品"
    end
    redirect_to product_path
  end

  private

  def product_params
    params.require(:product).permit(:is_hidden)
  end
end
