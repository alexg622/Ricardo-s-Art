class ArtistsController < ApplicationController 

	def index
		@paintings = Painting.all.sort_by{|painting| painting.price.tr(',', '').to_i}.reverse
	end 

	def show 
		@artist = Artist.find(params[:id])
	end

	def edit
		if current_user
			@artist = Artist.find(params[:id])
		else 
			redirect_to root_path
		end 
	end 

	def update
		if current_user
			@artist = Artist.find(params[:id])
			@artist.assign_attributes(artists_params)
			if @artist.save
				redirect_to @artist 
			else 
				@errors = @artist.errors.full_messages 
				render 'edit'
			end 
		else 
			redirect_to root_path
		end 
	end  

	def artists_params
		params.require(:artist).permit(:first_name, :last_name, :email, :phone, :bio, :password, :avatar)
	end 
end 