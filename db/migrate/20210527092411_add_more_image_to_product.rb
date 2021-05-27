class AddMoreImageToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :image_third, :string
    add_column :products, :image_fourth, :string
    add_column :products, :image_fifth, :string
  end
end
