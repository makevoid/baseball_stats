class Player
  include DataMapper::Resource
  
  property :id,         Serial
  property :player_id,  Integer
  property :birth_year, Integer
  property :first_name, String
  property :last_name,  String
end