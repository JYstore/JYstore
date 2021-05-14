class AddProductImageToProductList < ActiveRecord::Migration[6.0]
  def change
    add_column :product_lists, :product_image, :string
  end
end
