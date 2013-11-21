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
  	redirect_to users_path('#{@user.id}')
  end
  def show
  	@user = User.find(params[:id])
  end
end
