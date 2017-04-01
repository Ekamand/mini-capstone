class User < ApplicationRecord
	has_secure_password
	has_many :products
	has_many :orders
	has_many :carted_products

	validates :name, length: { minimum: 2 }
	validates :email, uniqueness: true
	validates :password, length: { in: 6..20 }
end
