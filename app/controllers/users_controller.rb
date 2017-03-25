class UsersController < ApplicationController

	before_action :authenticate_user! 
	def new
	end

	def create 
		@user = User.new(name: params[:user_name],
						email: params[:user_email],
						password: params[:user_password], 
						password_confirmation: params[:user_password_conformation])

		if @user.save 
			#success
			session[:user_id] = @user.id
			flash[:success] = "you have signed up"
			redirect_to "/"
		else
			#failure
			flash[:warning] = "invalid email or password"
			redirect_to "/signup"
		end


	end
end
