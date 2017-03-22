class SuppliersController < ApplicationController
 

	def index
		@supplier = Supplier.all
	end

		def show
		
	end

	# def suppliers
	# 	Supplier.where(supplier_id: id)
	# end

end
