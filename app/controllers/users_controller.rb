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
      flash[:notice] = "Form Data Invalid!"
      flash[:color] = "invalid"
      redirect_to ('/') and return
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
    @user = User.find(:first, :conditions => {:id => session[:id]})
    if (session[:id] != params[:id])
	    @friend = User.find(:first, :conditions => {:id => params[:id]})
	  end
    if Wallpost.find(:first, :conditions => {:user_id => params[:id].to_i})
    	@wallposts = Wallpost.find(:all, :conditions => {:user_id => params[:id].to_i})
    end
  	if (@user == nil)
	  	flash[:notice] = "Invalid Session Data!"
	    flash[:color] = "invalid"
		  redirect_to ('/')
	  end
  end
  def index
		@wallposts = Wallpost.all
		if (session[:email] == nil)
				redirect_to ('/') and return
		end
		@user = User.find(session[:id])
  end
  def edit
  	@user = User.find(session[:id])
  end
  def update
  	@user = User.find(session[:id])
  	if @user.update_attributes!(params[:user])
	    flash[:notice] = "Profile Information Updated!"
      flash[:color] = "valid"
	  else
	  	flash[:notice] = "Problem saving information, Profile information not updated!"
	    flash[:color] = "invalid"
	  end
   	@user = User.find(session[:id])
   	session[:email] = @user.email
   	params[:email] = @user.email
    redirect_to user_path(@user.id)
  end
  def rfriend # request friend
  	@user = User.find(session[:id])
  	@friend = User.find(params[:id])
  	@friend.requests << @user.id
  	flash[:notice] = "#{@friend.firstName} #{@friend.lastName} added as a friend!"
    flash[:color] = "valid"
  	redirect_to user_path(params[:id])
  end
  def afriend # accept friend
  end
  def dfriend # deny friend
  end
  def remfriend # remove friend
  end
  def main
  end
  def search
  end
end
