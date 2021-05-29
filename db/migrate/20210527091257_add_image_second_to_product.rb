class AddImageSecondToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :image_second, :string
  end
end
