require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe WallpostsController do

  # This should return the minimal set of attributes required to create a valid
  # Wallpost. As you add validations to Wallpost, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "content" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # WallpostsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all wallposts as @wallposts" do
      wallpost = Wallpost.create! valid_attributes
      get :index, {}, valid_session
      assigns(:wallposts).should eq([wallpost])
    end
  end

  describe "GET show" do
    it "assigns the requested wallpost as @wallpost" do
      wallpost = Wallpost.create! valid_attributes
      get :show, {:id => wallpost.to_param}, valid_session
      assigns(:wallpost).should eq(wallpost)
    end
  end

  describe "GET new" do
    it "assigns a new wallpost as @wallpost" do
      get :new, {}, valid_session
      assigns(:wallpost).should be_a_new(Wallpost)
    end
  end

  describe "GET edit" do
    it "assigns the requested wallpost as @wallpost" do
      wallpost = Wallpost.create! valid_attributes
      get :edit, {:id => wallpost.to_param}, valid_session
      assigns(:wallpost).should eq(wallpost)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Wallpost" do
        expect {
          post :create, {:wallpost => valid_attributes}, valid_session
        }.to change(Wallpost, :count).by(1)
      end

      it "assigns a newly created wallpost as @wallpost" do
        post :create, {:wallpost => valid_attributes}, valid_session
        assigns(:wallpost).should be_a(Wallpost)
        assigns(:wallpost).should be_persisted
      end

      it "redirects to the created wallpost" do
        post :create, {:wallpost => valid_attributes}, valid_session
        response.should redirect_to(Wallpost.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved wallpost as @wallpost" do
        # Trigger the behavior that occurs when invalid params are submitted
        Wallpost.any_instance.stub(:save).and_return(false)
        post :create, {:wallpost => { "content" => "invalid value" }}, valid_session
        assigns(:wallpost).should be_a_new(Wallpost)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Wallpost.any_instance.stub(:save).and_return(false)
        post :create, {:wallpost => { "content" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested wallpost" do
        wallpost = Wallpost.create! valid_attributes
        # Assuming there are no other wallposts in the database, this
        # specifies that the Wallpost created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Wallpost.any_instance.should_receive(:update_attributes).with({ "content" => "MyString" })
        put :update, {:id => wallpost.to_param, :wallpost => { "content" => "MyString" }}, valid_session
      end

      it "assigns the requested wallpost as @wallpost" do
        wallpost = Wallpost.create! valid_attributes
        put :update, {:id => wallpost.to_param, :wallpost => valid_attributes}, valid_session
        assigns(:wallpost).should eq(wallpost)
      end

      it "redirects to the wallpost" do
        wallpost = Wallpost.create! valid_attributes
        put :update, {:id => wallpost.to_param, :wallpost => valid_attributes}, valid_session
        response.should redirect_to(wallpost)
      end
    end

    describe "with invalid params" do
      it "assigns the wallpost as @wallpost" do
        wallpost = Wallpost.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Wallpost.any_instance.stub(:save).and_return(false)
        put :update, {:id => wallpost.to_param, :wallpost => { "content" => "invalid value" }}, valid_session
        assigns(:wallpost).should eq(wallpost)
      end

      it "re-renders the 'edit' template" do
        wallpost = Wallpost.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Wallpost.any_instance.stub(:save).and_return(false)
        put :update, {:id => wallpost.to_param, :wallpost => { "content" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested wallpost" do
      wallpost = Wallpost.create! valid_attributes
      expect {
        delete :destroy, {:id => wallpost.to_param}, valid_session
      }.to change(Wallpost, :count).by(-1)
    end

    it "redirects to the wallposts list" do
      wallpost = Wallpost.create! valid_attributes
      delete :destroy, {:id => wallpost.to_param}, valid_session
      response.should redirect_to(wallposts_url)
    end
  end

end
