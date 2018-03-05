require_relative 'spec_helper'

describe "Room class" do

  it "intializes a new room" do
    new_room = Hotel::Room.new(50)
    new_room.room_number.must_equal 50
    new_room.must_be_kind_of Hotel::Room
    
  end
end
