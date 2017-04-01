class SuppliersController < ApplicationController
 
	before_action :authenticate_admin!

	def index
		@suppliers = Supplier.all
	end

		def show
			supplier_id = params[:id]
		@suppliers = Supplier.find_by(id: supplier_id)
	end

	def update
		@suppliers = Supplier.find_by(id: params[:id])
	end

	# def suppliers
	# 	Supplier.where(supplier_id: id)
	# end

end
