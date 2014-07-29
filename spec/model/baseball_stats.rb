describe BaseballStats do
  
  before :all do
    @stats = BaseballStats.new
  end
  
  describe "most improved batting average" do
    it "outputs the batting average" do
      years_range = 2009..2010
      @stats.batting_average years_range
    end
  end
  
  describe "slugging percentage" do
    it "outputs the slugging percentage" do
      team, year = :OAK, 2007
      @stats.slugging_percentage team, year
    end
  end
  
  describe "triple crown winner" do
    it "outputs the triple crown winner" do
      year = 2011      
      @stats.triple_crown_winner year
      
      year = 2012
      @stats.triple_crown_winner year      
    end
  end
  
  
end