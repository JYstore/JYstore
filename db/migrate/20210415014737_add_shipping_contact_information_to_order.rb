class AddShippingContactInformationToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :shipping_contact_information, :string
  end
end
