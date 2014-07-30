require "spec_helper"

describe BaseballStats do
  
  before :all do
    @stats = BaseballStats.new
    BaseballStats::Loader.import_data
  end
  
  describe "most improved batting average" do
    it "outputs the batting average" do
      years_range = 2009..2010
      bats = @stats.batting_average years_range
      bat = bats.first
      bat.batting_average.should == 0.0398
      bat.player.full_name.should == "David Aardsma"
    end
  end
  
  describe "slugging percentage" do
    it "outputs the slugging percentage" do
      team, year = :SEA, 2010
      bats = @stats.slugging_percentage team, year
      bat = bats.first
      bat.slugging_percentage.should == 0.0697
    end
  end
  
  describe "triple crown winner" do
    it "outputs the triple crown winner" do
      year = 2011      
      @stats.triple_crown_winner year
      
      year = 2012
      @stats.triple_crown_winner year      
      # TODO: add matchers and implement
    end
  end
  
  after :all do
    DataMapper.auto_migrate!
  end
  
end