class UsersController < ApplicationController
  def new
  	@user = User.new
  end
  def create
  	@user = User.new(params[:user])
  	if @user.save
  		flash[:notice] = "You have successfully signed up for Schadenfreude!"
  		flash[:color] = "valid"
  	else
  		flash[:notice] = "Form is invalid!"
  		flash[:color] = "invalid"
  	end
  	session[:email] = @user.email
  	params[:id] = @user.id.to_s
  	@user.save
  	redirect_to ('/users/' + params[:id])			#users_path(params[:id])
  end
  def show
  	@user = User.find(:first, :conditions => {:email => session[:email]})
  	if (params[:id] != @user.id.to_s)
	  	params[:id] = @user.id.to_s
	  	redirect_to ('/users/' + params[:id])
	  end
  end
  def index
  	@users = User.all
  end
  def main
  end
end
