class Product < ApplicationRecord
	belongs_to :supplier
	has_many :images
	has_many :carted_products
	has_many :orders, through: :carted_products

	has_many :categories, through: :categorized_products
	has_many :categorized_products



	validates :name, presence: true, numericality: false
	validates :price, presence: true
	validates :price, numericality: { greater_than: 0}
	validates :stock, presence: true
	validates :stock, numericality: { greater_than: 0}

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
	@product_price = self.price
	if @product_price < 2 
		"Discount Item!"
	else
		return "Everyday low price!!"
	end
  end

	def tax
		tax = @product_price.to_i * 9/100
	end

	def total 
		total = @product_price.to_i + tax.to_i
	end
end
