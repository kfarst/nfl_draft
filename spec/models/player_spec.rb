require 'spec_helper'

describe Player do
  context "missing name" do
    it "should not be saved" do
      player = Factory.build(:player, :name => "")
      player.save.should_not be_true
    end
  end

  context "missing position" do
    it "should not be saved" do
      player = Factory.build(:player, :position => "")
      player.save.should_not be_true
    end
  end
end
