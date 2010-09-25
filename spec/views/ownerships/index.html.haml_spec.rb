require 'spec_helper'

describe "ownerships/index.html.haml" do
  before(:each) do
    assign(:ownerships, [
      stub_model(Ownership,
        :team_id => 1,
        :player_id => 1,
        :round => 1,
        :pick => 1
      ),
      stub_model(Ownership,
        :team_id => 1,
        :player_id => 1,
        :round => 1,
        :pick => 1
      )
    ])
  end

  it "renders a list of ownerships" do
    render
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
  end
end
