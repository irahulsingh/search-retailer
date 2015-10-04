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
	end

	private

	def retailer_params
		params.require(:retailer).permit(:name, :address, :phone)
	end
end
