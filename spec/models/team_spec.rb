require 'spec_helper'

describe Team do
  context "Missing team name" do
    it "should not save the record" do
      player = Factory.build(:team, :name => "")
      player.save.should_not be_true
    end
  end

  context "Missing team division" do
    it "should not save the record" do
      player = Factory.build(:team, :division => "")
      player.save.should_not be_true
    end
  end

  describe ".acquire" do
    context "A team aquires a player" do
      it "should create a new ownership of the player by the team"
    end
  end
end
