class Painting < ApplicationRecord
	validates :name_of_painting, :price, :description, presence: true
	mount_uploader :avatar, AvatarUploader
	belongs_to :artist 
end
