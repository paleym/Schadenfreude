class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by_email(params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password]) #auth doesn't work, you were looking up how to make the auth method work. Sign in machinery still does not work yet.
			#
		else
			flash[:flash] = 'Invalid email/password combination'
			render 'new'
		end
	end

	def destroy
	end
end
