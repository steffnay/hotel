require_relative 'spec_helper'

describe "Room class" do

  it "intializes a new room" do
    new_room = Hotel::Room.new(50)
    new_room.room_number.must_equal 50
    new_room.must_be_kind_of Hotel::Room

  end

  describe "add new" do
    it "adds a new reservation for the room" do
      a_room = Hotel::Room.new(9)
      before = a_room.reservations.length
      a_room.add_new(800, 9, "2020-02-24", "2020-02-28")
      after = a_room.reservations.length
      after.must_equal (before + 1)
    end
  end
end
