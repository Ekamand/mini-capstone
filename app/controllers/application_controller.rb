class ApplicationController < ActionController::Base
  	protect_from_forgery with: :exception
	helper_method :shopping_cart_count
	helper_method :all_categories


	def current_user 
		@current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
	end

	helper_method :current_user   #to make method available


	def authenticate_user!
	    if !current_user
	      flash[:danger] = "You must be logged in to do that!"
	      redirect_to "/login"
  		end
	end

	def authenticate_admin!
    	if !(current_user && current_user.admin)
	      flash[:danger] = "You must be an admin to do that!"
	      redirect_to "/"
		end
	end

	def all_categories
		Category.all
	end


	def shopping_cart_count 
	    if current_user
	      current_user.carted_products.where(status: "carted").length
	    end
	end
	

end
