class AddBillingContactInformationToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :billing_contact_information, :string
  end
end
