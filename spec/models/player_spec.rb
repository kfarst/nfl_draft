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

  context "when drafted" do
    let(:player) { Factory(:player, :drafted => 1) }

    it "should have an ownership" do
      player.should_have(1).ownership
    end

    it "should belong to a team" do
      player.should_have(1).team
    end
  end
end
