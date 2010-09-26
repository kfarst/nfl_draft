require 'spec_helper'

describe Team do
  context "missing team name" do
    it "should not be saved" do
      player = Factory.build(:team, :name => "")
      player.save.should_not be_true
    end
  end

  context "missing team division" do
    it "should not be saved" do
      player = Factory.build(:team, :division => "")
      player.save.should_not be_true
    end
  end

  describe ".acquire" do
    let(:team) { Factory(:team) }
    let(:player) { Factory(:player) }

    before(:each) { team.aquire(player) }

    it "should create an ownership" do
      team.ownership.should be_new_record
    end

    it "should have ownership of the player" do
      team.ownership.player.should == player
    end
  end
end
