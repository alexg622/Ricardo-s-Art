class PaintingsController < ApplicationController
	def index 
		@paintings = Painting.all
		@artist = Artist.find(current_user.id) 
	end 

	def new 
		@painting = Painting.new 
		@artist = Artist.find(params[:artist_id])
	end 

	def create 
		@painting = Painting.new(paintings_params)
		@artist = Artist.find(params[:artist_id])
		if @painting.save
			redirect_to artist_painting_path(@artist, @painting) 
		else 
			@errors = @painting.errors.full_messages
			render 'new'
		end 
	end 

	def show 
		@painting = Painting.find(params[:id])
		@artist = @painting.artist 
	end 

	def edit
		@artist = Artist.find(params[:artist_id])
		@painting = Painting.find(params[:id])
	end 

	def update 
		@painting = Painting.find(params[:id])
		@artist = Artist.find(params[:artist_id])
		@painting.assign_attributes(paintings_params)
		if @painting.save
			redirect_to artist_painting_path(@artist, @painting) 
		else 
			@errors = @painting.errors.full_messages
			render 'edit'
		end
	end 

	def destroy
		@painting = Painting.find(params[:id])
		@painting.delete
		redirect_to root_path
	end  

	def paintings_params
		params.require(:painting).permit(:artist_id, :name_of_painting, :price, :description, :avatar)
	end 
end 
