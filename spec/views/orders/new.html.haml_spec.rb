require 'spec_helper'

describe "orders/new.html.haml" do
  before(:each) do
    assign(:order, stub_model(Order,
      :new_record? => true,
      :round => 1,
      :pick => 1,
      :team => "MyString"
    ))
  end

  it "renders new order form" do
    render

    rendered.should have_selector("form", :action => orders_path, :method => "post") do |form|
      form.should have_selector("input#order_round", :name => "order[round]")
      form.should have_selector("input#order_pick", :name => "order[pick]")
      form.should have_selector("input#order_team", :name => "order[team]")
    end
  end
end
