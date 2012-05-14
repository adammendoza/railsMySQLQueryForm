# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



Customer.delete_all
open("#{Rails.root}/db/migrate/customers.txt") do |customers|
	customers.read.each_line do |customer|
		customer_id, first_name, last_name, email_address, postal_code, password, status, date_added, created_by, created_date, modified_by, modified_date, is_deleted = customer.chomp.split("|")
		Customer.create!(:customer_id => customer_id, :first_name => first_name, :last_name => last_name, :email_address => email_address, :postal_code => postal_code, :password => password, :status => status, :date_added => date_added, :created_by => created_by, :created_date => created_date, :modified_by => modified_by, :modified_date => modified_date, :is_deleted => is_deleted )
	end
end


#TO DO Add other tables