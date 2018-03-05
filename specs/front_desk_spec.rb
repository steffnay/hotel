require_relative 'spec_helper'

describe "Front Desk class" do

  describe "instantiation" do
    it "creates a new front desk" do
      desk = Hotel::FrontDesk.new
      desk.must_be_kind_of Hotel::FrontDesk
    end

    it "loads all rooms" do
      desk = Hotel::FrontDesk.new
      desk.all_rooms.must_be_kind_of Array
      desk.all_rooms.length.must_equal 20
    end
  end

  describe "list rooms" do
    it "lists all the rooms in hotel" do
      desk = Hotel::FrontDesk.new
      desk.list.must_include "Room 2"
    end
  end
end
