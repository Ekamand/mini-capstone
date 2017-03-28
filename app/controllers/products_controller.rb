class ProductsController < ApplicationController

	 before_action :authenticate_user! 

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
		@categories = Category.all
		category_id = params[:category_id]
		if category_id 
			@category = Category.find_by(id: category_id)
			@products = @category.products
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
		@product = Product.all
		# @order = @order.find_by(id:)
		item_id = params[:id]
		puts "=" *50
		puts "selected item id: " +item_id
		puts "=" *50
		@product = Product.find_by(id: item_id)

		@product_price = @product.price
		@product_tax = @product_price * 0.0875
		@product_total = @product_price + @product_tax
		# @stock = @product.stock -= self.order.quantity
	end

	def create
	  if params[:input_name] == nil
	  else
	  	puts "*" * 100
	  	@product = Product.create(name: params[:input_name], description: params[:input_description], price: params[:input_price],
	  	 supplier_id: params[:input_supplier_id], user_id: params[:user_id].to_i, stock: params[:input_stock])
	  	# @product = Product.id
	  	@image = Image.create(photo: params[:input_image])
	  	# @product.save
	  	flash[:success] = "item created successfully!"

	  	redirect_to "/products/#{@product.id}"
	  end
	end

	def new
	end

	def update

		@product = Product.find_by(id: params[:id])
		

		puts "*" *100
		@product.update(name: params[:input_name], description: params[:input_description], price: params[:input_price],
		supplier_id: params[:input_supplier_id], user_id: params[:user_id].to_i, stock: params[:input_stock],)	
		# puts @product.inspect
		# @product.save
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


			def tax
		tax = @product_price.to_i * 8.50/100
	end

	def total 
		total = @product_price.to_i + tax.to_i
	end
	end
end
