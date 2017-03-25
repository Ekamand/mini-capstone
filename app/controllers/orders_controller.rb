class OrdersController < ApplicationController

	def create

		quantity = params[:input_order_qty]
		product_id = params[:input_product_id]
		@product = Product.find_by(id: product_id)
		image = @product.images.first.photo
		order_subtotal = @product.price * quantity.to_i
		order_tax = order_subtotal * 0.0875
		order_total = order_subtotal + order_tax
		updated_stock = @product.stock.to_i - quantity.to_i

		# @order.subtotal =  @order.calculate_subtotal(@product.price, quantity.to_i)

@order = Order.new(quantity: params[:input_order_qty], product_id: params[:input_product_id], user_id: session[:user_id],
		 subtotal: order_subtotal, tax: order_tax, total: order_total)
@product.update(stock: updated_stock)

# @order.calculate_subtotal(order_subtotal, quantity.to_i)
# @order.calculate_tax
# @order.calculate_total
		@order.save
		redirect_to "/orders/#{@order.id}"
	end

	def show
		# order_id = params[:id]
		# puts "Order id: #{order_id}"

		@order = Order.find_by(id: params[:id])
		
	end
end
