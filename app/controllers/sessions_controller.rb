class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      @user = user
      session[:id] = @user.id.to_s
	    session[:email] = @user.email
	    session[:view] = "home"
  	  params[:id] = @user.id.to_s
      redirect_to ('/users/' + params[:id])
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
  	sign_out
  	redirect_to root_url
  end
end
