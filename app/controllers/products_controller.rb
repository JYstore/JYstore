class ProductsController < ApplicationController
  before_action :validate_search_key, only: [:search]
  before_action :authenticate_user!, only: [:add_to_cart]

  def index
    if params[:category].blank?
      @products = Product.where(:is_hidden => true).paginate(:page => params[:page], :per_page => 8)
    else
      @category = Category.find_by(id: params[:category]) #找出是哪个category
      @products = Product.where(:is_hidden => true, :category => @category).paginate(:page => params[:page], :per_page => 8) #找出这个category下的Job
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def welcome_show
    @products = Product.where(:is_hidden => true)

    @product_hots = Product.where(:is_hidden => true, :category => "1").limit(4)
    @product_xians = Product.where(:is_hidden => true, :category => "2").limit(4)
    @product_xias = Product.where(:is_hidden => true, :category => "3").limit(4)

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

  def search
    if @query_string.present?
      search_result = Product.ransack(@search_criteria).result(:distinct => true)
      @products = search_result.paginate(:page => params[:page], :per_page => 8 )
    end
  end

  protected

  def validate_search_key
    @query_string = params[:q].gsub(/\\|\'|\/|\?/, "") if params[:q].present?
    @search_criteria = search_criteria(@query_string)
  end

  def search_criteria(query_string)
    { :title_cont => query_string }
  end

  private

  def product_params
    params.require(:product).permit(:is_hidden)
  end
end
