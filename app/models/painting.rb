class Painting < ApplicationRecord
	validates :artist, :artist_email, :artist_phone_number, :name_of_painting, :price, :description, presence: true
end
