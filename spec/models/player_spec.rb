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

  describe "#undrafted" do
    before(:each) do
      player1 = Factory(:player, :name => "John Smith")
      player2 = Factory(:player, :name => "Dave Johnson")
      player3 = Factory(:player, :name => "Craig Billings")
    end

    it "should return an array of Player objects" do
      Player.undrafted.each do |player|
        player.should be_a(Player)
      end
    end

    it "should return all of the currently undrafted players" 
    it "should return all of the currently undrafted players" 
  end

  describe "#alphabetical_by_last_name" do
    before(:each) do
      player1 = Factory(:player, :name => "John Smith")
      player2 = Factory(:player, :name => "Dave Johnson")
      player3 = Factory(:player, :name => "Craig Billings")
    end

    it "should return an array of Player objects" do
      Player.undrafted.each do |player|
        player.should be_a(Player)
      end
    end

    it "should return all of the currently undrafted players" 
    it "should return all of the currently undrafted players" 
  end
end
