class CartedProductsController < ApplicationController
	before_action :authenticate_user!

		def index
			@carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
			if @carted_products.empty?
				flash[:danger] = "Your Cart is empty."
				redirect_to "/"
			end
		end

		def update
			@carted_products = CartedProduct.find_by(id: params[:id])
			quantity = params[:input_quantity]
			# @carted_product = CartedProduct.find_by(id: params[:id])
			@carted_products = CartedProduct.update(
							quantity: quantity)
			# @carted_products.save
			# @carted_product.save

		end

	def create 


		product_id = params[:input_product_id]
		quantity = params[:input_product_qty]

		@carted_products = CartedProduct.new(
							quantity: quantity, 
							user_id: current_user.id,
							product_id: product_id, 
							status: "carted")

		# @carted_product.save
		if @carted_products.save
			flash[:success] = "product added to Cart"
			redirect_to "/products/#{product_id}"
		else 
			if @carted_products.errors.messages[:quantity].empty?
				flash[:danger] = "Product couldn't be added to the cart for some reatson. Please try Again"
			else 
				flash[:danger] = "You must enter a number greater than 0"
				end
			redirect_to "/products/#{product_id}"
		
	end
end

	def show
 		@carted_products = CartedProduct.all
	end

	def destroy
		@carted_products = CartedProduct.find_by(id: params[:id])
		@carted_products.status = "removed"
		@carted_products.save

		flash[:success] = "Item Removed from cart"
		redirect_to "/cart"

	end
end