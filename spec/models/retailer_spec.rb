require 'rails_helper'

RSpec.describe Retailer, type: :model do
  before do
  	@retailer = FactoryGirl.create(:retailer)
  end

  subject { @retailer }

  it { should respond_to :name }
  it { should respond_to :address }
  it { should respond_to :phone }
  it { should respond_to :lat }
  it { should respond_to :lng }

  it {should be_valid}

  describe "name, address can't be blank" do 
  	before do
  		@retailer.name = nil
  		@retailer.address = nil 
  	end

  	it { should_not be_valid }
  end

  describe "should automatically populate lat, lng if address present" do 
  	before do
  		@retailer = Retailer.new(name: "test", address: Faker::Address.street_address)
  		@retailer.save 
  		@retailer.reload
  	end

  	it { should be_valid }

  	it "should not have nil lat, lng" do
		expect(@retailer.lat.to_f).not_to eq(nil)
		expect(@retailer.lat).to be_kind_of(BigDecimal)
		expect(@retailer.lng.to_f).not_to eq(nil)
		expect(@retailer.lng).to be_kind_of(BigDecimal)
	end
  end

  describe "should geocode if address changed" do 
  	before do 
  		new_address = "Sector 11, Indira Nagar, Lucknow, India"
  		@geocode = Geocoder.search(new_address)

  		@retailer.address = new_address
  		@retailer.save
  	end

  	it { should be_valid }

  	it "should update lat, lng" do
	  	expect(@retailer.lat.to_f).to eq(@geocode.first.latitude)
	  	expect(@retailer.lng.to_f).to eq(@geocode.first.longitude)
	end
  end

end
