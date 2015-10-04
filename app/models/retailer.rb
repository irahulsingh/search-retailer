class Retailer < ActiveRecord::Base
	validates_presence_of :name, :address, :lat, :lng

	RADIUS = (10..100).step(10).to_a.map { |x| [x.to_s+'km',x] }

	geocoded_by :address, latitude: :lat, longitude: :lng
	after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
end
