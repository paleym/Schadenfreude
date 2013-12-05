class User < ActiveRecord::Base
	EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
	validates :email, :presence => true, :uniqueness => true, format: { with: EMAIL_REGEX } , length: { maximum: 50 }
	validates :password, :confirmation => true, length: { minimum: 8 }
	validates :firstName, presence => true, length: { maximum: 50 }
	validates :lastName, presence => true, length: { maximum: 50 }
	
	attr_accessible :firstName, :lastName, :email, :password, :birthday
end
