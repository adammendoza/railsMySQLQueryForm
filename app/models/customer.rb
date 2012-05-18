
# TO DO: Encrypt password. Need hash and salt fields on DB


class Customer < ActiveRecord::Base
 attr_accessible :customer_id, :first_name, :last_name, 
 :email_address, :postal_code, :password, :status, :date_added, 
 :created_by, :created_date, :modified_by, :modified_date, :is_deleted

  validates_presence_of :password, :on => :create
  validates_presence_of :email_address
  validates_uniqueness_of :email_address
  validates_format_of :email_address, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i

  
end