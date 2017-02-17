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


end