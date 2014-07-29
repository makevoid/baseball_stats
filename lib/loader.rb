class BaseballStats
  class Loader
    def self.import_data
      new.import_data
    end
    
    def initialize
      
    end
    
    def import_data
      bats    = read_bats
      players = read_players
      
      import_bats    bats
      import_players players
    end
    
    
  end
end