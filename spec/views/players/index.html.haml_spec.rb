require 'spec_helper'

describe "players/index.html.haml" do
  before(:each) do
    assign(:players, [
      stub_model(Player,
        :first_name => "First Name",
        :last_name => "Last Name",
        :position => "Position",
        :drafted => false
      ),
      stub_model(Player,
        :first_name => "First Name",
        :last_name => "Last Name",
        :position => "Position",
        :drafted => false
      )
    ])
  end

  it "renders a list of players" do
    render
    rendered.should have_selector("tr>td", :content => "First Name".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Last Name".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Position".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => false.to_s, :count => 2)
  end
end
