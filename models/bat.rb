class Bat
  include DataMapper::Resource
  
  property :id,           Serial
  property :player_id,    Integer, index: true
  property :year,         Integer, index: true
  property :league,       String
  property :team_id,      String,  index: true
  # property :g,            Integer # ?
  property :at_bats,      Integer
  # property :r,            Integer # ?
  property :hits,         Integer
  property :doubles,      Integer
  property :triples,      Integer
  property :home_runs,    Integer
  property :runs_batted,  Integer
  # property :sb,           Integer # ?
  # property :cs,           Integer # ?
  
  
  # computed properties
  
  property :batting_average,     Integer
  property :slugging_percentage, Float
  
  
  before :create do
    self.batting_average      = calc_batting_average
    self.slugging_percentage  = calc_slugging_percentage
  end
  
  
  # formulas
  
  def calc_batting_average
    hits / at_bats
  end
  
  def calc_slugging_percentage
    (hits - doubles - triples - home_runs + 2 * doubles + 3 * triples + 4 * home_runs).to_f / at_bats
  end
  
  
  # properties
  
  def team
    team_id.to_sym
  end
  
end