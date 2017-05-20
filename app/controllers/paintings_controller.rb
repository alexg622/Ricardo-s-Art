class PaintingsController < ApplicationController
	def index 
		@paintings = Painting.all 
	end 

	def new 
		@painting = Painting.new 
	end 

	def create 
		@painting = Painting.new(paintings_params)
		if @painting.save
			redirect_to @painting 
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
		@painting = Painting.find(params[:id])
	end 

	def update 
		@painting = Painting.find(params[:id])
		@painting.assign_attributes(paintings_params)
		if @painting.save
			redirect_to @painting 
		else 
			@errors = @painting.errors.full_messages
			render 'edit'
		end
	end 

	def destroy
		@painting = Painting.find(params[:id])
		@painting.delete
		redirect_to paintings_path
	end  

	def paintings_params
		params.require(:painting).permit(:artist_id, :name_of_painting, :price, :description, :avatar)
	end 
end 
