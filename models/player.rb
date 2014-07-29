class Player
  include DataMapper::Resource
  
  property :id,         Serial
  property :birth_year, Integer
  property :first_name, String
  property :last_name,  String
  property :player_id,  String, index: true
  
  has n, :bats
end