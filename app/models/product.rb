class Product < ApplicationRecord
	belongs_to :supplier
	has_many :images

 #  def image_checker
	# @product = @images.first.photo
	# if @product == ""

	#   # @product.image = "http://2.bp.blogspot.com/-NBniP7HEcqw/UJgO7lopaII/AAAAAAAACCs/u5X5wEimHoI/s1600/not-found.png"
	#    # image_tag("not_found.png")
	#   # <%= image_tag("not_found.png")
	# else
	# 	return @product
	# end
 #  end

  def sale_message
	@product = self.price
	if @product < 2 
		"Discount Item!"
	else
		return "Everyday low price!!"
	end
  end

	def tax
		tax = self.price * 9/100
	end

	def total 
		total = @product + tax 
	end
end
