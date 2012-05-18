class Query < ActiveRecord::Base
  attr_accessible :customer_email, :customer_first_name, :customer_last_name, :max_total_amount,
   :min_total_amount, :order_id, :order_is_deleted, :order_max_date, :order_min_date, :results_limit, :postal_code, :subscribes_to_daily_emails

def orders
    @orders ||= find_orders
end
  
#TO DO:
#1. Pagination:
#2. Add limit if not present when there could be too many results. DONE! Set limit to 50.
#3. Add export feature and remove limit for export.

private
  def find_orders

@results_limitVar = nil

if results_limit.nil? == true
    @results_limitVar = 50
else
    @results_limitVar = results_limit    
end
   
@subscribes_to_daily_emailsVar = nil

if subscribes_to_daily_emails.nil? == false
  if subscribes_to_daily_emails 
    @subscribes_to_daily_emailsVar = 1
  else 
    @subscribes_to_daily_emailsVar = 0
  end
end


@order_is_deletedVar = nil

if order_is_deleted.nil? == false
  if order_is_deleted 
    @order_is_deletedVar = 1
  else 
    @order_is_deletedVar = 0
  end
end

#Added orders explicitly because otherwise first_name, etc is ambiguous 
#since it is in multiple models.

    orders = Order.order(:order_id)
    orders = orders.where("orders.first_name LIKE ?", "%#{customer_first_name}%") if customer_first_name.present?
    orders = orders.where("orders.last_name LIKE ?", "%#{customer_last_name}%") if customer_last_name.present?    
    orders = orders.where("orders.email_address LIKE ?", "%#{customer_email}%") if customer_email.present?        
    orders = orders.where("orders.order_id like ?", "%#{order_id}%") if order_id.present?
    orders = orders.where("orders.is_deleted = ?", "#{@order_is_deletedVar}") if !@order_is_deletedVar.nil?
    orders = orders.where("total_amount >= ?", min_total_amount) if min_total_amount.present?
    orders = orders.where("total_amount <= ?", max_total_amount) if max_total_amount.present?
    orders = orders.where("order_date >= ?", order_min_date) if order_min_date.present?
    orders = orders.where("order_date <= ?", order_max_date) if order_max_date.present?
    orders = orders.joins("INNER JOIN customers ON customers.customer_id = orders.customer_id AND customers.postal_code LIKE ", "'%#{postal_code}%'") if postal_code.present?
    orders = orders.joins("INNER JOIN email_preferences ON email_preferences.customer_id = orders.customer_id AND email_preferences.subscribes_to_daily_emails = ", "#{@subscribes_to_daily_emailsVar}") if !@subscribes_to_daily_emailsVar.nil?  
    orders = orders.limit(@results_limitVar) if !@results_limitVar.nil? 
    orders
  end

end