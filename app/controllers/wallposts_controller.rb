class WallpostsController < ApplicationController
  # GET /wallposts
  # GET /wallposts.json
  def index
    @wallposts = Wallpost.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @wallposts }
    end
  end

  # GET /wallposts/1
  # GET /wallposts/1.json
  def show
    @wallpost = Wallpost.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @wallpost }
    end
  end

  def new
  	@poster = User.find(:first, :conditions => {:id => session[:id]})
  	@friend = User.find(:first, :conditions => {:id => params[:id]})
    @wallpost = Wallpost.new
  end

  def edit
    @wallpost = Wallpost.find(params[:id])
  end

  # POST /wallposts
  # POST /wallposts.json
  def create
    if @wallpost = Wallpost.new(params[:wallpost])
    	flash[:notice] = "Wallpost created!"
      flash[:color] = "valid"
	  else
	  	flash[:notice] = "Problem creating Wallpost!"
	    flash[:color] = "invalid"
	  end
	 	redirect_to ('/user' + params[:id])
	end

  def update
    @wallpost = Wallpost.find(params[:id])

    respond_to do |format|
      if @wallpost.update_attributes(params[:wallpost])
        format.html { redirect_to @wallpost, notice: 'Wallpost was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @wallpost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wallposts/1
  # DELETE /wallposts/1.json
  def destroy
    @wallpost = Wallpost.find(params[:id])
    @wallpost.destroy

    respond_to do |format|
      format.html { redirect_to wallposts_url }
      format.json { head :ok }
    end
  end
end
