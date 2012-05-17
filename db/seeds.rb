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


Address.delete_all

open("#{Rails.root}/db/migrate/addresses.txt") do |addresses|
	addresses.read.each_line do |address|
		address_id, first_name, last_name, address_1, address_2, postal_code, city, phone, created_by, created_date, modified_by, modified_date = address.chomp.split("|")
		Address.create!(:address_id => address_id, :first_name => first_name, :last_name => last_name, :address_1 => address_1, :address_2 => address_2, :postal_code => postal_code, :city => city, :phone => phone, :created_by => created_by, :created_date => created_date, :modified_by => modified_by, :modified_date => modified_date)
	end
end


Email_preference.delete_all

open("#{Rails.root}/db/migrate/emailpreferences.txt") do |email_preferences|
	email_preferences.read.each_line do |email_preference|
		customer_id, subscribes_to_daily_emails, subscribes_to_special_promos, subscribes_to_weekly_calendar, created_by, created_date, modified_by, modified_date, is_deleted = email_preference.chomp.split("|")
		Email_preference.create!(:customer_id => customer_id, :subscribes_to_daily_emails => subscribes_to_daily_emails, :subscribes_to_special_promos => subscribes_to_special_promos, :subscribes_to_weekly_calendar => subscribes_to_weekly_calendar, :created_by => created_by, :created_date => created_date, :modified_by => modified_by, :modified_date => modified_date, :is_deleted => is_deleted)
	end
end


Order.delete_all

open("#{Rails.root}/db/migrate/orders.txt") do |orders|
	orders.read.each_line do |order|
		 order_id, customer_id, first_name, last_name, email_address, shipping_address_id, payment_method_id, total_amount, tax_amount, gift_card_amount, shipping_amount, handling_amount, order_date, submitted_date, status, created_by, created_date, modified_by, modified_date, is_deleted = order.chomp.split("|")
		Order.create!(:order_id => order_id, :customer_id => customer_id, :first_name => first_name, :last_name => last_name, :email_address => email_address, :shipping_address_id => shipping_address_id, :payment_method_id => payment_method_id, :total_amount => total_amount, :tax_amount => tax_amount, :gift_card_amount => gift_card_amount, :shipping_amount => shipping_amount, :handling_amount => handling_amount, :order_date => order_date, :submitted_date => submitted_date, :status => status, :created_by => created_by, :created_date => created_date, :modified_by => modified_by, :modified_date =>modified_date, :is_deleted => is_deleted)
	end
end