require 'spec_helper'

describe OwnershipsController do

  def mock_ownership(stubs={})
    @mock_ownership ||= mock_model(Ownership, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all ownerships as @ownerships" do
      Ownership.stub(:all) { [mock_ownership] }
      get :index
      assigns(:ownerships).should eq([mock_ownership])
    end
  end

  describe "GET show" do
    it "assigns the requested ownership as @ownership" do
      Ownership.stub(:find).with("37") { mock_ownership }
      get :show, :id => "37"
      assigns(:ownership).should be(mock_ownership)
    end
  end

  describe "GET new" do
    it "assigns a new ownership as @ownership" do
      Ownership.stub(:new) { mock_ownership }
      get :new
      assigns(:ownership).should be(mock_ownership)
    end
  end

  describe "GET edit" do
    it "assigns the requested ownership as @ownership" do
      Ownership.stub(:find).with("37") { mock_ownership }
      get :edit, :id => "37"
      assigns(:ownership).should be(mock_ownership)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created ownership as @ownership" do
        Ownership.stub(:new).with({'these' => 'params'}) { mock_ownership(:save => true) }
        post :create, :ownership => {'these' => 'params'}
        assigns(:ownership).should be(mock_ownership)
      end

      it "redirects to the created ownership" do
        Ownership.stub(:new) { mock_ownership(:save => true) }
        post :create, :ownership => {}
        response.should redirect_to(ownership_url(mock_ownership))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved ownership as @ownership" do
        Ownership.stub(:new).with({'these' => 'params'}) { mock_ownership(:save => false) }
        post :create, :ownership => {'these' => 'params'}
        assigns(:ownership).should be(mock_ownership)
      end

      it "re-renders the 'new' template" do
        Ownership.stub(:new) { mock_ownership(:save => false) }
        post :create, :ownership => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested ownership" do
        Ownership.should_receive(:find).with("37") { mock_ownership }
        mock_ownership.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :ownership => {'these' => 'params'}
      end

      it "assigns the requested ownership as @ownership" do
        Ownership.stub(:find) { mock_ownership(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:ownership).should be(mock_ownership)
      end

      it "redirects to the ownership" do
        Ownership.stub(:find) { mock_ownership(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(ownership_url(mock_ownership))
      end
    end

    describe "with invalid params" do
      it "assigns the ownership as @ownership" do
        Ownership.stub(:find) { mock_ownership(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:ownership).should be(mock_ownership)
      end

      it "re-renders the 'edit' template" do
        Ownership.stub(:find) { mock_ownership(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested ownership" do
      Ownership.should_receive(:find).with("37") { mock_ownership }
      mock_ownership.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the ownerships list" do
      Ownership.stub(:find) { mock_ownership }
      delete :destroy, :id => "1"
      response.should redirect_to(ownerships_url)
    end
  end

end
