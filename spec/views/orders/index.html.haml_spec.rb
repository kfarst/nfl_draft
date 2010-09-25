require 'spec_helper'

describe "orders/index.html.haml" do
  before(:each) do
    assign(:orders, [
      stub_model(Order,
        :round => 1,
        :pick => 1,
        :team => "Team"
      ),
      stub_model(Order,
        :round => 1,
        :pick => 1,
        :team => "Team"
      )
    ])
  end

  it "renders a list of orders" do
    render
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Team".to_s, :count => 2)
  end
end
