class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(params[:user])
    if @user.save()
      sign_in @user
      flash[:notice] = "You have successfully signed up for Schadenfreude!"
      flash[:color] = "valid"
    else
      flash[:notice] = params
      flash[:color] = "invalid"
    end
    session[:id] = @user.id.to_s
    session[:email] = @user.email
    session[:view] = "home"
    params[:id] = @user.id.to_s
    @user.save
    redirect_to ('/users/' + params[:id])
  end
  def show
  	if session[:email] == nil
  	  flash[:notice] = "Sign in to see profile information!"
      flash[:color] = "invalid"
  		redirect_to ('/') and return
  	end
    @user = User.find(:first, :conditions => {:id => params[:id]})
  	if (@user == nil)
	  	flash[:notice] = "Invalid Session Data!"
	    flash[:color] = "invalid"
		  redirect_to ('/')
	  end
  end
  def index
		@users = User.all
		if (session[:email] == nil)
				@users = nil
		end
  end
  def edit
  	@user = User.find(session[:id])
  end
  def update
  	@user = User.find(session[:id])
  	if @user.update_attributes!(params)	
	    flash[:notice] = "Profile Information Updated!"
      flash[:color] = "valid"
	  else
	  	flash[:notice] = "Problem saving information, Profile information not updated!"
	    flash[:color] = "invalid"
	  end
    redirect_to user_path(@user)
  end
  def main
  end
  def search
  end
end
