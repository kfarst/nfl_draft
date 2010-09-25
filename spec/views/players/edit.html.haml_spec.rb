require 'spec_helper'

describe "players/edit.html.haml" do
  before(:each) do
    @player = assign(:player, stub_model(Player,
      :new_record? => false,
      :first_name => "MyString",
      :last_name => "MyString",
      :position => "MyString",
      :drafted => false
    ))
  end

  it "renders the edit player form" do
    render

    rendered.should have_selector("form", :action => player_path(@player), :method => "post") do |form|
      form.should have_selector("input#player_first_name", :name => "player[first_name]")
      form.should have_selector("input#player_last_name", :name => "player[last_name]")
      form.should have_selector("input#player_position", :name => "player[position]")
      form.should have_selector("input#player_drafted", :name => "player[drafted]")
    end
  end
end
