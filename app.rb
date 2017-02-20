#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:pizzashop.db"
class Product < ActiveRecord::Base
end

class Order < ActiveRecord::Base
end



get '/cart' do
	#erb :index
end

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

	if @cart_items.length==0
		erb "You cart is empty now"
	else
		erb :cart
	end
end

post '/orders' do
	@order = Order.create params[:order]
	erb :order_placed
end 


get '/admin' do
	@orders = Order.order ("id desc")
	erb :admin
end