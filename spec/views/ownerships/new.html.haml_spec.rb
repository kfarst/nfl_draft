require 'spec_helper'

describe "ownerships/new.html.haml" do
  before(:each) do
    assign(:ownership, stub_model(Ownership,
      :new_record? => true,
      :team_id => 1,
      :player_id => 1,
      :round => 1,
      :pick => 1
    ))
  end

  it "renders new ownership form" do
    render

    rendered.should have_selector("form", :action => ownerships_path, :method => "post") do |form|
      form.should have_selector("input#ownership_team_id", :name => "ownership[team_id]")
      form.should have_selector("input#ownership_player_id", :name => "ownership[player_id]")
      form.should have_selector("input#ownership_round", :name => "ownership[round]")
      form.should have_selector("input#ownership_pick", :name => "ownership[pick]")
    end
  end
end
