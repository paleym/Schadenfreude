class User < ActiveRecord::Base
	has_secure_password
	attr_accessible :firstName, :lastName, :email, :password, :birthday 
	attr_accessor :password_confirmation
	EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

	before_save { |user| user.email = email.downcase }

	validates :firstName, presence: true, length: { mininum: 1, maximum: 50 }
	validates :lastName, presence: true, length: { mininum: 1, maximum: 50 }
	validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
	validates :password, presence: true, length: { mininum: 6, maximum: 50 }
	validates :password_confirmation, presence: true
	
end
