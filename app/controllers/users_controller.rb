class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(params[:user])
    if @user.save()
      flash[:notice] = "You have successfully signed up for Schadenfreude!"
      flash[:color] = "valid"
    else
      flash[:notice] = "Form is invalid!"
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
  		redirect_to ('/')
  	end
    @user = User.find(:first, :conditions => {:email => session[:email]})
    if (@user == nil)
    	flash[:notice] = "Invalid Session Data!"
      flash[:color] = "invalid"
  		redirect_to ('/')
    elsif (params[:id] != @user.id.to_s)
      params[:id] = @user.id.to_s
      redirect_to ('/users/' + params[:id])
    end
  end
  def index
		@users = User.all
		if (session[:email] == nil)
				@users = nil
		end
  end
  def main
  end
end
