require 'spec_helper'

describe "orders/edit.html.haml" do
  before(:each) do
    @order = assign(:order, stub_model(Order,
      :new_record? => false,
      :round => 1,
      :pick => 1,
      :team => "MyString"
    ))
  end

  it "renders the edit order form" do
    render

    rendered.should have_selector("form", :action => order_path(@order), :method => "post") do |form|
      form.should have_selector("input#order_round", :name => "order[round]")
      form.should have_selector("input#order_pick", :name => "order[pick]")
      form.should have_selector("input#order_team", :name => "order[team]")
    end
  end
end
