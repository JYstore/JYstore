class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.bigint "order_id", comment: "订单"
      t.timestamps
    end
  end
end
