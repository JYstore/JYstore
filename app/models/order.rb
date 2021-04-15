class Order < ApplicationRecord
   belongs_to :user

   validates :billing_name, presence: true
   validates :billing_address, presence: true
   validates :billing_contact_information, presence: true
   validates :shipping_name, presence: true
   validates :shipping_address, presence: true
   validates :shipping_contact_information, presence: true
   has_many :product_lists

   def set_payment_with!(method)
     self.update_columns(payment_method: method )
   end

   def pay!
     self.update_columns(is_paid: true )
   end
end
