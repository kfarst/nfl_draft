require 'spec_helper'

describe "ownerships/show.html.haml" do
  before(:each) do
    @ownership = assign(:ownership, stub_model(Ownership,
      :team_id => 1,
      :player_id => 1,
      :round => 1,
      :pick => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain(1.to_s)
    rendered.should contain(1.to_s)
    rendered.should contain(1.to_s)
    rendered.should contain(1.to_s)
  end
end
