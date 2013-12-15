class User < ActiveRecord::Base
	attr_accessible :firstName, :lastName, :email, :password, :birthday
	attr_accessible :password_confirmation
	has_secure_password
	 
	EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

	before_save { |user| user.email = email.downcase }
	before_save :create_remember_token

	validates :firstName, presence: true, length: { mininum: 1, maximum: 50 }
	validates :lastName, presence: true, length: { mininum: 1, maximum: 50 }
	validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
	validates :password, presence: true, length: { mininum: 6, maximum: 50 }
	validates :password_confirmation, presence: true

	private

    	def create_remember_token
      		self.remember_token = SecureRandom.urlsafe_base64
   		end
	
end
