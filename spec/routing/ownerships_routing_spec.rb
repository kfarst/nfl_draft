require "spec_helper"

describe OwnershipsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/ownerships" }.should route_to(:controller => "ownerships", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/ownerships/new" }.should route_to(:controller => "ownerships", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/ownerships/1" }.should route_to(:controller => "ownerships", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/ownerships/1/edit" }.should route_to(:controller => "ownerships", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/ownerships" }.should route_to(:controller => "ownerships", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/ownerships/1" }.should route_to(:controller => "ownerships", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/ownerships/1" }.should route_to(:controller => "ownerships", :action => "destroy", :id => "1")
    end

  end
end
