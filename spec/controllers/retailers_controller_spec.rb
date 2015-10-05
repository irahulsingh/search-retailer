require 'rails_helper'

RSpec.describe RetailersController, type: :controller do
	describe "GET new" do
		it "assigns @retailer" do 
			get :new
			expect(assigns(:retailer)).to be_a_new(Retailer)
		end

		it "renders the new retailer view" do
			get :new
			expect(response).to render_template("new")
		end
	end

	describe "POST create" do
		context "with valid params" do
			it "assigns @retailer and create a new retailer record" do 
				expect{
					post :create, retailer: { name: "test", phone: "1233456789", address: "India" }
				}.to change(Retailer, :count).by(1)
			end

			it "redirect to new retailer view" do
				post :create, retailer: { name: "test", phone: "1233456789", address: "India" }
				expect(response).to redirect_to new_retailer_url
			end
		end

		context "with invalid params" do 
			it "does not save the new retailer" do
				expect{
					post :create, retailer: { name: nil, phone: "1233456789", address: nil }
				}.to_not change(Retailer, :count)
		    end

		    it "re-renders the new method" do
		    	post :create, retailer: { name: nil, phone: "1233456789", address: nil }
		    	expect(response).to render_template :new
		    end
		end
	end

end
