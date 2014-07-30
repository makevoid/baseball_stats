require "spec_helper"

describe BaseballStats::Loader do 
  it "loads example CSVs and creates dm records" do
    subject.import_data
    Player.count.should == 3
    Bat.count.should == 2
  end
  
  after :all do
    DataMapper.auto_migrate!
  end
end