class AddUserIdToProductList < ActiveRecord::Migration[6.0]
  def change
    add_column :product_lists, :user_id, :integer
  end
end
