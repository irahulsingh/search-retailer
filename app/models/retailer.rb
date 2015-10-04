class Retailer < ActiveRecord::Base
	validates_presence_of :name, :address, :lat, :lng

	RADIUS = (10..100).step(10).to_a.map { |x| [x.to_s+'km',x] }
end
