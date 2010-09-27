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
      pick1 = Factory(:order, :round => 1, :pick => 1)
      pick2 = Factory(:order, :round => 1, :pick => 2)
      pick3 = Factory(:order, :round => 2, :pick => 3)
    end

    it "should return an array of Order objects" do
      Order.draft.each do |pick|
        pick.should be_a(Order)
      end
    end

    it "should return the order of the draft"
  end
end
