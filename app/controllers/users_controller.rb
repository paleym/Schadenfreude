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
    session[:id] = @user.id.to_s
    session[:email] = @user.email
    session[:view] = "home"
    params[:id] = @user.id.to_s
    @user.save
    redirect_to ('/users/' + params[:id])
  end
  def show
  	if (session[:view] == nil)
  		reset_session()
  		flash[:notice] = "You must log in before viewing User's profile pages!"
      flash[:color] = "invalid"
  		session[:view] = "login"
  		params[:action] = index
  		redirect_to ('/users')
  	end
    if (session[:view] == "home")
      @user = User.find(:first, :conditions => {:email => session[:email]})
      if (params[:id] != @user.id.to_s)
        params[:id] = @user.id.to_s
        redirect_to ('/users/' + params[:id])
      end
    elsif (session[:view] == "search")
      @user = User.find(:first, :conditions => {:id => session[:searchfor]})
    elsif (session[:view] == "logout")
      @user = nil
      session[:email] = nil
      session[:id] = nil
      params[:action] = index
      session[:view] = "login"
      redirect_to ('/users')
    else
      flash[:notice] = "You must log in before viewing User's profile pages!"
      flash[:color] = "invalid"
      session[:view] = "login"
      params[:action] = index
      redirect_to ('/users')
    end
  end
  def index
  	if (session[:view] = "search")
		    @users = User.all
		elsif (session[:view] = "login")
				@users = nil
		end
  end
  def search
    @user = User.find(:first, :conditions => {:email => session[:email]})
  end
end
