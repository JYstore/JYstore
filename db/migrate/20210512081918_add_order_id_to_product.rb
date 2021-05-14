class AddOrderIdToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :order_id, :integer
  end
end
