# Baseball Stats

### Setup
    
    bundle

    ruby lib/tasks/setup.rb


### Running

    ...
    


### Proposed architecture (infos)

Given the csv files provided are a subset of the real production database
I will import everything into sqlite and model the backend around it
The datastore can be switched to MySQL or Postgres for a real production environment
The core queries could be optimized using Redis in a the future 


### Requirements

1) Most improved batting average( hits / at-bats) from 2009 to 2010. Only include players with at least 200 at-bats.
2) Slugging percentage for all players on the Oakland A's (teamID = OAK) in 2007. 3) Who was the AL and NL triple crown winner for 2011 and 2012. If no one won the crown, output "(No winner)"

