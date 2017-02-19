#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'


class Product < ActiveRecord::Base
end
set :database, "sqlite3:pizzashop.db"

get '/' do
	#erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
 
  @products = Product.all
  erb :index
end

get '/about' do
  erb :about
end

post '/cart' do
	@cart_items = {}
	@orders_pizza = params[:orders].split(",")
	@orders_pizza.each do |product|
		equalsplit = product.split('=')
		key = equalsplit[0].split('_')[1]
		@cart_items[key]=equalsplit[1]

	end
	@products = Product.all
	erb :cart
end

post '/orders' do
	@customer = params[:customer]
	@phone = params[:phone]
	@address = params[:address]
	@products = params[:products]
	erb :orders
end 