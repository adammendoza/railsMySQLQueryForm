class Email_preference < ActiveRecord::Base
 attr_accessible :customer_id, :subscribes_to_daily_emails, 
 :subscribes_to_special_promos, :subscribes_to_weekly_calendar, 
 :created_by, :created_date, :modified_by, :modified_date, :is_deleted
  
end