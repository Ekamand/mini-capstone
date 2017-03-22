class ProductsController < ApplicationController

	 

	def index
		sort = params[:sort]
		sort_order = params[:sort_order]
		price = params[:price]


		if price
			@products = Product.where("price < ?", 2)
			if sort 
				@products = @products.order(:price)
			end
		elsif sort && sort_order
			@products = Product.all.order(sort)
			@products = Product.all.order(sort => sort_order)
		else 
			@products = Product.all
		end
	end


	def discription_split
		products.split(", ")
	end

	def search
		search_term = params[:search_term]
		@products = Product.where("name ILIKE?", "%#{search_term}%")
		render :index
	end

	def show
		@products = Product.all

		item_id = params[:id]
		puts "=" *50
		puts "selected item id: " +item_id
		puts "=" *50
		@product = Product.find_by(id: item_id)
	end

	def create
	  if params[:input_name] == nil
	  else
	  	puts "*" * 100
	  	@product = Product.create(name: params[:input_name], description: params[:input_description], price: params[:input_price], image: params[:input_image])
	  	# @product = Product.id

	  	flash[:success] = "item created successfully!"

	  	redirect_to "/products/#{@product.id}"
	  end
	end

	def new
	end

	def update

		@product = Product.find_by(id: params[:id])
		puts "*" *100
		@product.update({name: params[:input_name], description: params[:input_description], price: params[:input_price], image: params[:input_image]})	

		@product.save
		flash[:info] = "item updated successfully!"
		redirect_to "/products"
		# redirect_to "/products/#{@product.id}"

	end

	def edit
		item_id = params[:id]
		@product = Product.find_by(id: item_id)
	end

	def destroy
			# WORKING CODE
		@product = Product.find_by(id: params[:id])
		@product.destroy
		puts "=" *50
		puts "deleted item: " +params[:id]
		puts "=" *50

		flash[:danger] = "item deleted successfully!"
		redirect_to "/products"
	end
end
