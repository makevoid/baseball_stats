require "spec_helper"

describe BaseballStats::Loader do 
  it "loads example CSVs and creates dm records" do
    subject.import_data
    Bat.count.should == 2
    Player.count.should == 1
  end
end