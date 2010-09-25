require 'spec_helper'

describe "orders/show.html.haml" do
  before(:each) do
    @order = assign(:order, stub_model(Order,
      :round => 1,
      :pick => 1,
      :team => "Team"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain(1.to_s)
    rendered.should contain(1.to_s)
    rendered.should contain("Team".to_s)
  end
end
