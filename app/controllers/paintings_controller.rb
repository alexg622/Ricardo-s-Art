class PaintingsController < ApplicationController

	def new 
		if current_user
			@painting = Painting.new 
			@artist = Artist.find(params[:artist_id])
		else
			redirect_to root_path
		end 
	end 

	def create 
		if current_user
			@painting = Painting.new(paintings_params)
			@artist = Artist.find(params[:artist_id])
			if @painting.save
				redirect_to artist_painting_path(@artist, @painting) 
			else 
				@errors = @painting.errors.full_messages
				render 'new'
			end 
		else 
			redirect_to root_path 
		end 
	end 

	def show 
		@painting = Painting.find(params[:id])
		@artist = @painting.artist 
	end 

	def edit
		if current_user
			@artist = Artist.find(params[:artist_id])
			@painting = Painting.find(params[:id])
		else 
			redirect_to root_path
		end 
	end 

	def update 
		if current_user
			@painting = Painting.find(params[:id])
			@artist = Artist.find(params[:artist_id])
			@painting.assign_attributes(paintings_params)
			if @painting.save
				redirect_to artist_painting_path(@artist, @painting) 
			else 
				@errors = @painting.errors.full_messages
				render 'edit'
			end
		else 
			redirect_to root_path
		end 
	end 

	def destroy
		if current_user
			@painting = Painting.find(params[:id])
			@painting.delete
			redirect_to root_path
		else 
			redirect_to root_path
		end 
	end  

	def paintings_params
		params.require(:painting).permit(:artist_id, :name_of_painting, :price, :description, :avatar)
	end 
end 
