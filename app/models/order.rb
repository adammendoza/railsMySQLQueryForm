
class Order < ActiveRecord::Base
 attr_accessible :order_id, :customer_id, :first_name, :last_name, 
 :email_address, :shipping_address_id, :payment_method_id, :total_amount,
  :tax_amount, :gift_card_amount, :shipping_amount, :handling_amount, 
  :order_date, :submitted_date, :status, :created_by, :created_date, 
  :modified_by, :modified_date, :is_deleted
  

  def self.query(order_id)
    orders = order(:order_id)
    orders = orders.where("order_id = ?", order_id) if order_id.present?
    orders
  end

end