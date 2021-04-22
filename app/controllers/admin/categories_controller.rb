class Admin::CategoriesController < ApplicationController
  layout "admin"
  before_action :find_category_by_id, only: [:edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :admin_required

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def update
    if @category.update(category_params)
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_path, warning: "你已删除这个分类"
  end

  private

  def find_category_by_id
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
