require 'spec_helper'

describe Order do
  context "missing round pick" do
    it "should not be saved" do
      order = Factory.build(:order, :round => 1, :pick => "")
      order.save.should_not be_true
    end
  end

  context "missing draft round" do
    it "should not be saved" do
      order = Factory.build(:order, :round => "", :pick => 1)
      order.save.should_not be_true
    end
  end

  context "missing team name" do
    it "should not be saved" do
      order = Factory.build(:order, :round => 1, :pick => 1, :team => "")
      order.save.should_not be_true
    end
  end

  describe "#draft" do
    before(:each) do
      @pick1 = Factory(:order, :round => 1, :pick => 1)
      @pick2 = Factory(:order, :round => 1, :pick => 2)
      @pick3 = Factory(:order, :round => 2, :pick => 3)
    end

    it "should return an array of Order objects" do
      Order.draft.each do |pick|
        pick.should be_a(Order)
      end
    end

    it "should return the order of the draft"
  end

  describe "#unchosen" do
    before(:each) do
      @pick1 = Factory(:order, :round => 1, :pick => 1, :chosen => true)
      @pick2 = Factory(:order, :round => 1, :pick => 2)
      @pick3 = Factory(:order, :round => 2, :pick => 3)
    end

    it "should return an array of Order objects" do
      Order.draft.each do |pick|
        pick.should be_a(Order)
      end
    end

    it "should only return draft picks that have yet to be chosen" do
      Order.unchosen.include?(@pick2).should be_true
      Order.unchosen.include?(@pick3).should be_true
    end

    it "should not return draft picks that have already been chosen" do
      Order.unchosen.include?(@pick1).should be_false
    end
  end

  describe "#next" do
    before(:each) do
      @pick1 = Factory(:order, :round => 1, :pick => 1, :chosen => true)
      @pick2 = Factory(:order, :round => 1, :pick => 2)
      @pick3 = Factory(:order, :round => 2, :pick => 3)
    end

    it "should return an Order object" do
      Order.next.should be_a(Order)
    end

    it "should return the next draft pick" do
      Order.next.should == @pick2
    end

    it "should not return draft picks that have already been chosen" do
      Order.next.should_not == @pick1
    end
  end

  describe "#chosen" do
    before(:each) do
      @pick1 = Factory(:order, :round => 1, :pick => 1, :chosen => true)
      @pick2 = Factory(:order, :round => 1, :pick => 2)
      @pick3 = Factory(:order, :round => 2, :pick => 3)
    end

    it "should return an array of Order objects" do
      Order.draft.each do |pick|
        pick.should be_a(Order)
      end
    end

    it "should not return draft picks that have not been chosen" do
      Order.chosen.include?(@pick2).should be_false
      Order.chosen.include?(@pick3).should be_false
    end

    it "should only return draft picks that have been chosen" do
      Order.chosen.include?(@pick1).should be_true
    end
  end

  describe "#previous" do
    before(:each) do
      @pick1 = Factory(:order, :round => 1, :pick => 1, :chosen => true)
      @pick2 = Factory(:order, :round => 1, :pick => 2)
      @pick3 = Factory(:order, :round => 2, :pick => 3)
    end

    it "should return an Order object" do
      Order.previous.should be_a(Order)
    end

    it "should return the previous draft pick" do
      Order.previous.should == @pick1
    end

    it "should not return draft picks that have not been chosen" do
      Order.previous.should_not == @pick2
      Order.previous.should_not == @pick3
    end
  end
end
