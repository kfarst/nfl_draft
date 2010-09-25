require 'spec_helper'

describe "players/show.html.haml" do
  before(:each) do
    @player = assign(:player, stub_model(Player,
      :first_name => "First Name",
      :last_name => "Last Name",
      :position => "Position",
      :drafted => false
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("First Name".to_s)
    rendered.should contain("Last Name".to_s)
    rendered.should contain("Position".to_s)
    rendered.should contain(false.to_s)
  end
end
