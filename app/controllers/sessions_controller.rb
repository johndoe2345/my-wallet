class SessionsController < ApplicationController
	
	def create
		@user = User.find_by(email: params[:email])
		if @user and @user.authenticate(params[:password])
			flash[:notice] = "Successfully signed in!"
			session[:id] = @user.id
		else
			flash[:alert] = "Something went wrong."
		end
		redirect_to root_path
	end

	def destroy
		session[:id] = nil
		flash[:notice] = "Signed out."
		redirect_to root_path
	end

end