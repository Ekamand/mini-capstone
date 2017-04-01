class OrdersController < ApplicationController
	before_action :authenticate_user!

	def create
		subtotal = 0
		
		@products = CartedProduct.where(user_id: current_user.id, status:"carted")
		@order = Order.new(user_id: current_user.id)

		# @product = @carted_products.product_id
		# puts "*" * 100 
		# puts @products

		@products.each do |prod|

			# productid = product.product_id
			 quantity = prod.quantity
			 item_price = prod.product.price

			 subtotal = @order.calculate_subtotal(item_price, quantity) + subtotal

			 # order_subtotal += (carted_products.product.price * carted_products.quantity)

			 # price = price * quantity.to_i
		end
			 @order.calculate_tax
			 @order.calculate_total
		
 		# order_tax = order_subtotal * 0.0875
 		# order_total = order_subtotal + order_tax


		if @order.save
			flash[:success] = "order Created"
			redirect_to "/orders/#{@order.id}"
		else
			flash[:danger] = "Could not make order"
			redirect_to "/cart"
		end


		@products.each do |y|
			y.update(order_id: @order.id, status:"Purchased")
		end

# 		# quantity = @carted_products.quantity.all
# 		 product_id = params[:input_product_id]
# 		@product = Product.find_by(id: product_id)
# 		image = @product.images.first.photo

# 		order_subtotal = @product.price * quantity.to_i
# 		order_tax = order_subtotal * 0.0875
# 		order_total = order_subtotal + order_tax
# 		updated_stock = @product.stock.to_i - quantity.to_i

# 		# @order.subtotal =  @order.calculate_subtotal(@product.price, quantity.to_i)

# 		@order = Order.new(user_id: session[:user_id],
# 		 				   subtotal: order_subtotal, tax: order_tax, total: order_total)


# 		@product.update(stock: updated_stock)

# # @order.calculate_subtotal(order_subtotal, quantity.to_i)
# # @order.calculate_tax
# # @order.calculate_total
# 		@order.save
		# redirect_to "/orders/#{@order.id}"
	end

	def show
		# order_id = params[:id]
		# puts "Order id: #{order_id}"

		@order = Order.find_by(id: params[:id])
		
	end
end
