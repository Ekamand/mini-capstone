

class ProductsController < ApplicationController

	def all_products
	@products = Product.all
		puts "*" *100
		 puts @products
	end

	def add_products
		input_name = params[:input_name]
		input_description = params[:input_description]
		input_price = params[:input_price]
		@product = Product.create(name: input_name, description: input_description, price: input_price)
	end
end
