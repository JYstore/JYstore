class AddMoreDetailsToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :description_detail, :text
    add_column :products, :advantage, :text
    add_column :products, :repertoire, :text
    add_column :products, :technical_parameters, :text
    add_column :products, :adaptive, :text
  end
end
