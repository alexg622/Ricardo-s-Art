class SessionsController < ApplicationController

	def new 
	end 

	def create 
		@user = User.find_by(username: params[:username])
		if @user
			if @user.authenticate(params[:password])
				login(@user)
				redirect_to root_path 
			end 
		else 
			@error = "Please put in your usernmae and password"
			render 'new'
		end 
	end 

	def destroy 
		logout 
		redirect_to root_path
	end 
end 