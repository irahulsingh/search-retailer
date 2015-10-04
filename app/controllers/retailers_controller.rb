class RetailersController < ApplicationController
	def new
		@retailer = Retailer.new
	end

	def create
		@retailer = Retailer.new(retailer_params)
		if @retailer.save
			redirect_to new_retailer_path
		else
			render :new
		end
	end

	def index
	end

	def search
		current_lat = cookies[:user_current_lat]
		current_lng = cookies[:user_current_lng]

		radius = params[:search][:radius]
		@retailers = Retailer.near([current_lat, current_lng], radius)
	end

	private

	def retailer_params
		params.require(:retailer).permit(:name, :address, :phone)
	end
end
