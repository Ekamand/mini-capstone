class SessionsController < ApplicationController

	def new     #for new session
	end

	def create    #to create cookie

		@user = User.find_by(email: params[:user_email])

		if @user && @user.authenticate(params[:user_password])
			session[:user_id] = @user.id
			flash[:success] = "successfully logged in!"
			redirect_to "/"
		else
			flash[:danger] = "email or password is invalid"
			redirect_to "/login"
		end

	end

	def destroy
		session[:user_id] = nil
		flash[:success] = "successfully logged out!"
		redirect_to "/"
	end
end
