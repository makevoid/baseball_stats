# I think the ui part is not critical so I will sketch it, a JSON API will be a better substitute of this, it's not even checking the parameters

require_relative "../config/env"
require "#{PATH}/baseball_stats"

class BaseballStats
  class UI
    ACTIONS = [:batting_average, :slugging_percentage, :triple_crown_winner]
    
    def initialize(args=[])
      @args = args
    end
    
    def run
      return help if @args == []
      return help unless ACTIONS.include? action

      stats = BaseballStats.new

      case action
        when :batting_average
          display_batting_average     stats.batting_average     arg1..arg2
        when :slugging_percentage
          display_slugging_percentage stats.slugging_percentage arg1.to_sym, arg2
        when :triple_crown_winner
          display_triple_crown_winner stats.triple_crown_winner arg1
      end
      
    end
    
    private
    
    # display methods (views)
    
    def display_batting_average(results)
      results.each do |result|
        player = player_get result.id
        output << [player.full_name, result.batting_average].join("\t\t") + "\n"
      end
    end
    
    def slugging_percentage(results)
      results.each do |result|
        player = player_get result.id
        output << [player.full_name, result.batting_average].join("\t\t") + "\n"
      end
    end
    
    def triple_crown_winner(results)
      
    end
    
    # player
    
    def player_get(bat_id)
      Bat.get(bat_id).player(fields: [:first_name, :last_name])
    end
    
    # main
    
    def output
      $stdout
    end
    
    def action
      @args[0].to_sym
    end
    
    def arg1
      @args[1]
    end
    
    def arg2
      @args[2]      
    end
    
    def help
      puts <<-HELP.gsub(/^ {6}/, '')
      Please run one of the following commands:
       
        - batting_average YEAR_START YEAR_END
          example: ./bin/baseball_stats batting_average 2009 2010
          
        - slugging_percentage TEAM, YEAR
          example: ./bin/baseball_stats slugging_percentage OAK 2007
        
        - triple_crown_winner YEAR
          example: ./bin/baseball_stats triple_crown_winner 2011
                  
      HELP
    end
  end 
end