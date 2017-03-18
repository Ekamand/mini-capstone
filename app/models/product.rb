class Product < ApplicationRecord


class String
  # colorization
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def red
    colorize(31)
  end

  def green
    colorize(32)
  end
end


def image_checker
	@image = self.image
  if @image == ""
  	# image-path("not_found.png")
    # image_tag("/assets/not_found.png")
  else
    return @image
  end
end




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
