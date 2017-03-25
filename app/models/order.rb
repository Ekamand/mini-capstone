class Order < ApplicationRecord
	belongs_to :user
	belongs_to :product, optional: true

	def calculate_subtotal(price, quanitiy)
		subtotal = price * quanitiy
	end
	def calculate_tax 
		tax = subtotal * 0.0875
	end

	def calculate_total 
		total = subtotal + tax 
	end
end
