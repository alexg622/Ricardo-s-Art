class Artist < ApplicationRecord
	has_secure_password
	mount_uploader :avatar, AvatarUploader
	validates :username, :password, :first_name, :last_name, :phone, :email, :bio, presence: true
	validates :username, uniqueness: true 
	has_many :paintings 
end
