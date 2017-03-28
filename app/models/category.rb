class Category < ApplicationRecord
	has_many :products, through: :categorized_products
	has_many :categorized_products
end
