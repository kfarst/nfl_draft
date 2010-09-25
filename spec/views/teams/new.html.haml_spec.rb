require 'spec_helper'

describe "teams/new.html.haml" do
  before(:each) do
    assign(:team, stub_model(Team,
      :new_record? => true,
      :name => "MyString",
      :division => "MyString"
    ))
  end

  it "renders new team form" do
    render

    rendered.should have_selector("form", :action => teams_path, :method => "post") do |form|
      form.should have_selector("input#team_name", :name => "team[name]")
      form.should have_selector("input#team_division", :name => "team[division]")
    end
  end
end
