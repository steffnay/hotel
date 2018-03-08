require_relative 'spec_helper'

describe "Block Reservation class" do

  describe "reservation instantiation" do
    it "creates a new instance of a block reservation" do
      new_block = Hotel::BlockReservation.new(3, [1,2,3], "2040-01-20", "2040-01-28")
      new_block.must_be_kind_of Hotel::BlockReservation
      new_block.num_of_rooms.must_equal 3
    end
  end

  describe "self.all" do
    it "returns an array of all block reservations" do
      new_block = Hotel::BlockReservation.new(3, [1,2,3], "2040-01-20", "2040-01-28")
      Hotel::BlockReservation.all.must_be_kind_of Array
    end
  end

end
