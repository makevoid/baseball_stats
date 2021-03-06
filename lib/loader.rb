require 'csv'

# monkeypatch
CSV::Converters[:nil_to_zero] = lambda{|s| 
  s.nil? ? 0 : s
}

class BaseballStats
  class PlayerNotFound < RuntimeError
    def initialize(bat)
      @bat = bat
    end
    def message
      "The player found on bats.csv was not present in players.csv - #{@bat}"
    end
  end
  
  class Loader
    def self.import_data
      new.import_data
    end
    
    def initialize
    end
    
    def import_data
      players = read :players
      bats    = read :bats
      
      import_players players
      import_bats    bats
    end
    
    private
    
    def read(name)
      path = ""
      path = "/test" if ENV["app_env"] == "test"
      CSV.read("#{PATH}/db#{path}/#{name}.csv", headers: true, header_converters: [:symbol], converters: [:nil_to_zero])
    end
    
    def import_players(players)
      players.each do |player|
        Player.create player
      end
    end
    
    def import_bats(bats)
      filter = [:g, :r, :sb, :cs]
      bats.each do |bat|
        bat = bat.to_hash
        filter.map{ |arg| bat.delete arg  } 
        player = find_player bat
        raise PlayerNotFound.new(bat) unless player
        bat.delete :player_id
        player.bats.create bat
      end
    end
    
    def find_player(bat)
      Player.first(player_id: bat[:player_id])
    end
  end
end