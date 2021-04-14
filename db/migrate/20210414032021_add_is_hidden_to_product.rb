class AddIsHiddenToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :is_hidden, :boolean, default: true
  end
end
