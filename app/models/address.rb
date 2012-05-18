
class Address < ActiveRecord::Base
 attr_accessible :address_id, :first_name, :last_name, :address_1, 
 :address_2, :postal_code, :city, :phone, :created_by, :created_date, 
 :modified_by, :modified_date
  
end