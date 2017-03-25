class SuppliersController < ApplicationController
 
	before_action :authenticate_user! 
	def index
		@suppliers = Supplier.all
	end

		def show
		@suppliers = Supplier.all
	end

	# def suppliers
	# 	Supplier.where(supplier_id: id)
	# end

end
