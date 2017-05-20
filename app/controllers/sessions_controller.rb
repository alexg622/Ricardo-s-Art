class SessionsController < ApplicationController

	def new 
	end 

	def create 
		@artist = Artist.find_by(username: params[:username])
		if @artist
			if @artist.authenticate(params[:password])
				login(@artist)
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