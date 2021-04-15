class Order < ApplicationRecord
   belongs_to :user

   validates :billing_name, presence: true
   validates :billing_address, presence: true
   validates :billing_contact_information, presence: true
   validates :shipping_name, presence: true
   validates :shipping_address, presence: true
   validates :shipping_contact_information, presence: true
   has_many :product_lists
end
