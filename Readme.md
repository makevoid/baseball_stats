# Baseball Stats

### Setup

ruby 1.9+ is required (I suggest latest ruby, 2.1.2p95, but any will work)

    
    bundle

    ruby lib/tasks/setup.rb


### Running

    ./bin/baseball_stats
    
will display a message that will guide you trough the app's usage infos.


### Proposed architecture (infos)

Given the csv files provided are a subset of the real production database
I will import everything into sqlite and model the backend around it
The datastore can be switched to MySQL or Postgres for a real production environment
The core queries could be optimized using Redis in a the future 


### Requirements

1) Most improved batting average( hits / at-bats) from 2009 to 2010. Only include players with at least 200 at-bats.
2) Slugging percentage for all players on the Oakland A's (teamID = OAK) in 2007. 3) Who was the AL and NL triple crown winner for 2011 and 2012. If no one won the crown, output "(No winner)"


### notes

Please note specs and other parts are not 100% complete and are there just to show how I usually write software. In mission critical projects my test coverage is higher and my code is more modular and optimized.


**Important:** All the queries are limited to 50 results
to edit the hardcoded limit go into baseball_stats.rb, BaseballStats class and edit the LIMIT constant