class ArtistsController < ApplicationController 

	def index
		@paintings = Painting.all 
	end 

	def show 
		@artist = Artist.find(params[:id])
	end

	def edit
		@artist = Artist.find(params[:id])
	end 

	def update
		@artist = Artist.find(params[:id])
		@artist.assign_attributes(artists_params)
		if @artist.save
			redirect_to @artist 
		else 
			@errors = @artist.errors.full_messages 
			render 'edit'
		end 
	end  

	def artists_params
		params.require(:artist).permit(:first_name, :last_name, :email, :phone, :bio, :password, :avatar)
	end 
end 