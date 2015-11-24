class ListingsController < ApplicationController
	def index
		@listings=Listing.all
	end
	def show
		@listing=Listing.find(params[:id])
	end
	def new
		@listing=Listing.new
	end
	def create
		@listing=Listing.create(list_params)
		if @listing.save
			flash[:notice]="Listing has been created"
     else
        flash[:notice]="Listing was not created"
			   render :new
		end
	end
	def edit
		@listing=Listing.find(params[:id])
	end
	def update
		@listing=Listing.find(params[:id])
		if @lisitng.update(list_params)
			flash[:notice]="Listing has been updated"
		else
			render :edit
		end
	end
	def destroy
		@listing=Listing.find(params[:id])
		@listing.destroy
		redirect_to listings_path
	end
	def list_params
		params.require(:listing).permit(:description)
	end
end