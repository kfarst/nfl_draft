require 'spec_helper'

describe "players/new.html.haml" do
  before(:each) do
    assign(:player, stub_model(Player,
      :new_record? => true,
      :first_name => "MyString",
      :last_name => "MyString",
      :position => "MyString",
      :drafted => false
    ))
  end

  it "renders new player form" do
    render

    rendered.should have_selector("form", :action => players_path, :method => "post") do |form|
      form.should have_selector("input#player_first_name", :name => "player[first_name]")
      form.should have_selector("input#player_last_name", :name => "player[last_name]")
      form.should have_selector("input#player_position", :name => "player[position]")
      form.should have_selector("input#player_drafted", :name => "player[drafted]")
    end
  end
end
