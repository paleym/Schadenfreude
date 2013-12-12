class SearchController < ApplicationController
	def new
		redirect_to ('/')
	end
	def index
		lastName = params[:input]
		@users = User.all
		@display = []
		@users.each do |user|
			if (user.lastName =~ /(#{lastName})/i)
				@display << user
			end
		end
	end
end
