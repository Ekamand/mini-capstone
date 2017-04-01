class CartedProduct < ApplicationRecord
	belongs_to :product
	belongs_to :user
	belongs_to :order, optional: true

	validates :quantity, numericality: { greater_than: 0}
	
end
