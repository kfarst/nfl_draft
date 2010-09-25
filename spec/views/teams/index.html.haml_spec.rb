require 'spec_helper'

describe "teams/index.html.haml" do
  before(:each) do
    assign(:teams, [
      stub_model(Team,
        :name => "Name",
        :division => "Division"
      ),
      stub_model(Team,
        :name => "Name",
        :division => "Division"
      )
    ])
  end

  it "renders a list of teams" do
    render
    rendered.should have_selector("tr>td", :content => "Name".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Division".to_s, :count => 2)
  end
end
