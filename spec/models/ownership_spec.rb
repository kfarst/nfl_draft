require 'spec_helper'

describe Ownership do
  context "missing round pick" do
    it "should not be saved" do
      ownership = Factory.build(:ownership, :round => "")
      ownership.save.should_not be_true
    end
  end

  context "missing draft round" do
    it "should not be saved" do
      ownership = Factory.build(:ownership, :pick => "")
      ownership.save.should_not be_true
    end
  end
end
