class BaseballStats
  
  LIMIT = 50
  
  def initialize
    # TODO: add configuration code here, like setting the limit or other features
  end
  
  # main methods
  
  def batting_average(year_range)
    Bat.all(:at_bats.gte => 200, :year.gte => year_range.min, :year.lte => year_range.max, limit: LIMIT, fields: [:id, :batting_average, :year], order: :batting_average.desc)
  end
  
  def slugging_percentage(team, year)
    Bat.all(team_id: team, year: year, limit: LIMIT, fields: [:id, :slugging_percentage], order: :slugging_percentage.desc)
  end  
  
  def triple_crown_winner(year)
    # TODO: implement
  end
  
  
  private
  
  # this is a generic formula, it doesn't belongs here, TODO: move
  
  def triple_crown_winner_formula
    # TODO: implement
  end
  
end