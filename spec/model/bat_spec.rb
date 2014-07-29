require "spec_helper"

describe Bat do 
  context "formulas" do
    it "calculates the slugging percentage" do
      attrs = { hits: 4, doubles: 1, triples: 1, home_runs: 1, at_bats: 4 }
      bat = Bat.new attrs
      bat.save

      bat.slugging_percentage.should == 2.5
    end
  end
end