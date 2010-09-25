require 'spec_helper'

describe "teams/show.html.haml" do
  before(:each) do
    @team = assign(:team, stub_model(Team,
      :name => "Name",
      :division => "Division"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Name".to_s)
    rendered.should contain("Division".to_s)
  end
end
