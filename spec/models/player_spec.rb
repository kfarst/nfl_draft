require 'spec_helper'

describe Player do
  context "Missing player name" do
    it "should not save the record" do
      player = Factory.build(:player, :name => "")
      player.save.should_not be_true
    end
  end

  context "Missing player position" do
    it "should not save the record" do
      player = Factory.build(:player, :position => "")
      player.save.should_not be_true
    end
  end
end
